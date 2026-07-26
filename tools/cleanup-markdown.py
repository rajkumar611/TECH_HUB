#!/usr/bin/env python3
import os
import re
from pathlib import Path

def clean_markdown_file(file_path):
    """Clean ASCII art decorations from markdown file"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    original = content

    # Remove box drawing characters
    content = re.sub(r'[╔╗╚╝║═╣╠╩╦╲╱]', '', content)

    # Remove lines with only decorative dashes (━ characters)
    content = re.sub(r'(?m)^━+\s*$', '', content)

    # Remove lines with only regular dashes or equals
    content = re.sub(r'(?m)^[-=]{5,}\s*$', '', content)

    # Remove multiple consecutive blank lines (keep max 2)
    content = re.sub(r'\n{3,}', '\n\n', content)

    # Trim trailing whitespace from each line
    content = '\n'.join(line.rstrip() for line in content.split('\n'))

    if content != original:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
        return True
    return False

# Find all markdown files
docs_path = Path('docs')
md_files = list(docs_path.rglob('*.md'))
md_files = [f for f in md_files if f.name != 'index.md']

print(f"Processing {len(md_files)} markdown files...")
cleaned_count = 0

for file_path in sorted(md_files):
    if clean_markdown_file(file_path):
        cleaned_count += 1
        print(f"  Cleaned: {file_path.relative_to('docs')}")

print(f"\nDone! Cleaned {cleaned_count}/{len(md_files)} files")
