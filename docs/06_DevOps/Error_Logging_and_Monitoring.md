ERROR LOGGING AND MONITORING
==============================

TWO DIFFERENT THINGS
---------------------
Logging frameworks and error monitoring platforms serve different purposes and
complement each other — they don't replace each other.

Logging framework:
- Creates and writes log records (text) to files, databases, console, etc.
- Lives INSIDE your application
- You configure where logs go
- Examples: Serilog, Log4Net, NLog

Error monitoring platform:
- A cloud-based service that RECEIVES errors, groups them, and alerts you
- Lives OUTSIDE your application (as a cloud service)
- Automatically captures crashes, stack traces, user context
- Examples: Raygun, Rollbar, Sentry


SERILOG (.NET LOGGING FRAMEWORK)
----------------------------------
What it is:
Serilog is a structured logging framework for .NET that writes logs as key-value pairs,
making them machine-readable and easily searchable.

Key features:
- Structured logging: logs data as objects, not just strings
- Supports sinks (destinations): files, console, databases, cloud services
- Works with modern cloud tools: Seq, Elasticsearch, Datadog, Splunk, Azure Monitor
- Optimised for .NET Core, microservices, and cloud-native apps

Example:
  Log.Information("Order {OrderId} created for customer {CustomerId}", orderId, customerId);
  → Serilog captures this as structured data: OrderId=123, CustomerId=456, Timestamp=...

Popular Serilog sinks:
- Serilog.Sinks.File       → write to .log files
- Serilog.Sinks.Console    → write to console/stdout
- Serilog.Sinks.Seq        → Seq log analysis tool
- Serilog.Sinks.Elasticsearch → Elastic stack
- Serilog.Sinks.ApplicationInsights → Azure Monitor


LOG4NET (.NET LOGGING FRAMEWORK)
----------------------------------
What it is:
Log4Net is a traditional, text-based logging framework for .NET. A port of the Java
Log4j library, adapted for .NET Framework apps.

Key characteristics:
- Writes plain text log messages to files, event logs, databases, email
- Configured via XML
- No native structured logging
- Best suited for legacy .NET Framework applications

Difference from Serilog:
  Serilog = structured, modern, cloud-ready (preferred for new projects)
  Log4Net = text-based, legacy, good for .NET Framework apps


RAYGUN AND ROLLBAR (ERROR MONITORING PLATFORMS)
-------------------------------------------------
Both are cloud-based error monitoring and crash reporting platforms.
They automatically capture exceptions, stack traces, and errors from your application
and present them in a dashboard with smart grouping and alerting.

What they do:
- Capture unhandled exceptions automatically
- Collect full stack traces with context
- Group repeated errors (so you don't get 10,000 alerts for the same bug)
- Track deployments (correlate errors with releases)
- Send real-time alerts (email, Slack, PagerDuty)
- Integrate with GitHub, Jira for issue tracking
- Show dashboards with error trends

Raygun:
- Strong mobile crash reporting (iOS, Android) + .NET web
- Real user monitoring features
- Good for SaaS products

Rollbar:
- Multi-language: JavaScript, Python, Ruby, PHP, .NET, Java, etc.
- Good deployment tracking
- Detailed occurrence tracking per error

Both have official .NET SDKs for easy ASP.NET Core integration.


CRASHLYTICS (MOBILE CRASH REPORTING)
--------------------------------------
What it is:
Firebase Crashlytics (by Google) is a real-time crash reporting and error monitoring
tool specifically for mobile apps (iOS and Android).

Captures: crashes, ANRs (App Not Responding), stack traces, device model, OS version,
and user context from mobile apps.

Part of the Firebase ecosystem.
Category equivalent: mobile equivalent of Raygun/Rollbar for web.


COMPARISON TABLE
-----------------
Tool         | Category              | Best for                | Part of
-------------|----------------------|-------------------------|----------
Serilog      | Logging framework    | Modern .NET structured logging | Your app (SDK)
Log4Net      | Logging framework    | Legacy .NET Framework apps | Your app (SDK)
Raygun       | Error monitoring     | .NET web + mobile       | Cloud service
Rollbar      | Error monitoring     | Multi-language web apps | Cloud service
Crashlytics  | Mobile crash reporting| iOS, Android apps      | Firebase (Google)
Dynatrace    | Full APM + monitoring | Enterprise, full-stack | Cloud service
Azure Monitor| Cloud monitoring     | Azure workloads         | Azure

The clean summary:
  Serilog/Log4Net CREATE logs.
  Raygun/Rollbar MONITOR and ALERT on errors.
  They complement each other — use both in production.


KEY FACTS TO REMEMBER
----------------------
- Logging frameworks (Serilog, Log4Net) write log records; they are part of your app
- Error monitoring (Raygun, Rollbar) capture and analyse errors in the cloud
- Serilog = structured logging, cloud-ready, preferred for .NET Core
- Log4Net = text-based, legacy .NET Framework apps
- Raygun/Rollbar = cloud error platforms: automatic crash capture, grouping, alerts
- Crashlytics = mobile-first crash reporting (Firebase/Google)
- Use Serilog (or similar) to write logs, and Raygun/Rollbar to monitor production errors
