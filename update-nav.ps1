param(
    [string]$YML  = "$PSScriptRoot\mkdocs.yml",
    [string]$DOCS = "$PSScriptRoot\docs"
)

# Scan the docs folder for category folders and .md files
# Folder structure in docs/ becomes nav structure in mkdocs.yml
# Example: docs/APIs & Web/REST.md becomes a nav entry under "APIs & Web"

function Build-NavStructure {
    param([string]$DocsPath)

    $nav = @()
    $nav += "  - Home: index.md"

    # Get all subdirectories (categories)
    $categories = Get-ChildItem -Path $DocsPath -Directory | Sort-Object Name

    foreach ($cat in $categories) {
        # Skip special folders
        if ($cat.Name -eq 'My') {
            Write-Host "  [SKIP] Folder: $($cat.Name) (in .gitignore)"
            continue
        }

        $catName = $cat.Name
        $nav += "  - $($catName):"

        # Get all .md files in this category folder, sorted alphabetically
        $files = Get-ChildItem -Path $cat.FullName -Filter '*.md' -File | Sort-Object Name

        if ($files.Count -eq 0) {
            Write-Host "  [EMPTY] Category: $catName"
        } else {
            foreach ($file in $files) {
                $relPath = Join-Path $catName $file.Name
                $fileTitle = $file.BaseName
                $nav += "    - $($fileTitle): $relPath"
                Write-Host "  [OK] $catName / $($file.Name)"
            }
        }
    }

    return $nav
}

# Build new nav structure
Write-Host "  Scanning docs folder for category structure..."
$newNav = Build-NavStructure $DOCS

# Read existing mkdocs.yml and preserve non-nav content
$ymlLines = Get-Content $YML
$navStartIdx = -1
$navEndIdx = -1

for ($i = 0; $i -lt $ymlLines.Count; $i++) {
    if ($ymlLines[$i] -match '^nav:') {
        $navStartIdx = $i
    }
    if ($navStartIdx -ge 0 -and $i -gt $navStartIdx -and $ymlLines[$i] -match '^[a-zA-Z_]' -and $ymlLines[$i] -notmatch '^\s') {
        $navEndIdx = $i
        break
    }
}

# If nav section not found, add it before the last section
if ($navStartIdx -eq -1) {
    $navStartIdx = $ymlLines.Count - 1
    $navEndIdx = $navStartIdx
}

if ($navEndIdx -eq -1) {
    $navEndIdx = $ymlLines.Count
}

# Rebuild the file with new nav
$output = @()
for ($i = 0; $i -lt $navStartIdx; $i++) {
    $output += $ymlLines[$i]
}

$output += "nav:"
$output += $newNav

for ($i = $navEndIdx; $i -lt $ymlLines.Count; $i++) {
    $output += $ymlLines[$i]
}

$output | Set-Content $YML -Encoding UTF8
Write-Host "  mkdocs.yml nav updated (structure based on docs/ folder organization)."
