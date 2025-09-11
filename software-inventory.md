# Software Inventory Report

Generated on: 2025-09-10 19:01:58 UTC

## Software Inventory

| Name | Description | Category | License | CVE Monitoring | Risk Level |
|------|-------------|----------|---------|----------------|------------|
| ansible | IT automation platform for configuration management and deployment | automation-tools | GPL-3.0 | ✅ | medium |
| composer | PHP dependency manager | package-manager | MIT | ✅ | medium |
| elixir | Dynamic, functional language for building scalable applications | programming-language | Apache-2.0 | ❌ | low |
| git | Git version control system with utility functions | version-control | GPL-2.0 | ✅ | low |
| go | Go programming language compiler and runtime | programming-language | BSD-3-Clause | ✅ | low |
| jq | Command-line JSON processor | development-tools | MIT | ✅ | low |
| laravel | Laravel application installer and project scaffolding tool | web-framework | MIT | ❌ | low |
| lazydocker | Simple terminal UI for Docker and Docker Compose | container-tools | MIT | ❌ | low |
| lazygit | Simple terminal UI for git commands | version-control | MIT | ❌ | low |
| ni | Universal package manager command interface | package-manager | MIT | ❌ | low |
| nixfmt | Official Nix code formatter following RFC style | development-tools | MPL-2.0 | ❌ | low |
| nodejs | Node.js JavaScript runtime environment | javascript-runtime | MIT | ✅ | medium |
| nodejs18 | Node.js 18 legacy support (EOL - migration required) | javascript-runtime | MIT | ❌ | high |
| nodejs-24 | Node.js v24 JavaScript runtime environment | javascript-runtime | MIT | ✅ | medium |
| npkill | Find and remove node_modules directories to free up disk space | development-tools | MIT | ❌ | low |
| php_84 | PHP 8.4 scripting language runtime | programming-language | PHP-3.01 | ✅ | medium |
| pnpm | Fast, disk space efficient package manager | package-manager | MIT | ✅ | medium |
| task | Task runner and build tool alternative to Make | build-tools | MIT | ❌ | low |

## Compliance Status

| Name | Approved | Approved By | Last Audit | Next Audit | Maintainer |
|------|----------|-------------|------------|------------|------------|
| ansible | ✅ | security-team | 2024-01-15 | 2024-07-15 | devops-team |
| composer | ✅ | security-team | 2024-01-15 | 2024-07-15 | backend-team |
| elixir | ✅ | security-team | 2024-01-15 | 2024-07-15 | backend-team |
| git | ✅ | security-team | 2024-01-15 | 2024-07-15 | devops-team |
| go | ✅ | platform-team | 2024-01-15 | 2024-07-15 | platform-team |
| jq | ✅ | security-team | 2024-01-15 | 2024-07-15 | devops-team |
| laravel | ✅ | security-team | 2024-01-15 | 2024-07-15 | backend-team |
| lazydocker | ✅ | security-team | 2024-01-15 | 2024-07-15 | devops-team |
| lazygit | ✅ | security-team | 2024-01-15 | 2024-07-15 | devops-team |
| ni | ✅ | security-team | 2024-01-15 | 2024-07-15 | frontend-team |
| nixfmt | ✅ | security-team | 2024-01-15 | 2024-07-15 | devops-team |
| nodejs | ✅ | security-team | 2024-01-15 | 2024-07-15 | frontend-team |
| nodejs18 | ❌ |  |  | 2024-03-15 | frontend-team |
| nodejs-24 | ✅ | security-team | 2024-01-15 | 2024-07-15 | frontend-team |
| npkill | ✅ | security-team | 2024-01-15 | 2024-07-15 | frontend-team |
| php_84 | ✅ | security-team | 2024-01-15 | 2024-07-15 | backend-team |
| pnpm | ✅ | security-team | 2024-01-15 | 2024-07-15 | frontend-team |
| task | ✅ | security-team | 2024-01-15 | 2024-07-15 | devops-team |

## Summary

- **Total Modules**: 18
- **Approved Modules**: 17
- **CVE Monitored**: 9
- **High Risk**: 1

## Module Details

### ansible

- **Business Justification**: Infrastructure automation and configuration management
- **Data Classification**: internal
- **Network Access**: bidirectional
- **Upstream**: https://www.ansible.com
- **Security Contact**: security@ansible.com

### composer

- **Business Justification**: PHP dependency management
- **Data Classification**: public
- **Network Access**: outbound-required
- **Upstream**: https://getcomposer.org/
- **Security Contact**: security@packagist.org

### elixir

- **Business Justification**: Backend development for distributed and fault-tolerant applications
- **Data Classification**: public
- **Network Access**: outbound-optional
- **Upstream**: https://elixir-lang.org
- **Security Contact**: https://github.com/elixir-lang/elixir/security

### git

- **Business Justification**: Essential for version control in software development
- **Data Classification**: public
- **Network Access**: outbound-only
- **Upstream**: https://git-scm.com/
- **Security Contact**: security@git-scm.com

### go

- **Business Justification**: Go programming language support for backend services and tooling
- **Data Classification**: public
- **Network Access**: outbound-required
- **Upstream**: https://golang.org/
- **Security Contact**: security@golang.org

### jq

- **Business Justification**: JSON processing in development and automation scripts
- **Data Classification**: public
- **Network Access**: none
- **Upstream**: https://jqlang.github.io/jq/
- **Security Contact**: https://github.com/jqlang/jq/security

### laravel

- **Business Justification**: Laravel project scaffolding and CLI tools
- **Data Classification**: public
- **Network Access**: outbound-required
- **Upstream**: https://laravel.com/
- **Security Contact**: taylor@laravel.com

### lazydocker

- **Business Justification**: Improves developer productivity with Docker container management
- **Data Classification**: public
- **Network Access**: none
- **Upstream**: https://github.com/jesseduffield/lazydocker
- **Security Contact**: https://github.com/jesseduffield/lazydocker/security

### lazygit

- **Business Justification**: Improves developer productivity with git operations
- **Data Classification**: public
- **Network Access**: none
- **Upstream**: https://github.com/jesseduffield/lazygit
- **Security Contact**: https://github.com/jesseduffield/lazygit/security

### ni

- **Business Justification**: Unified interface for different package managers (npm, yarn, pnpm)
- **Data Classification**: public
- **Network Access**: none
- **Upstream**: https://github.com/antfu/ni
- **Security Contact**: https://github.com/antfu/ni/security

### nixfmt

- **Business Justification**: Standardized code formatting for Nix files
- **Data Classification**: public
- **Network Access**: none
- **Upstream**: https://github.com/NixOS/nixfmt
- **Security Contact**: https://github.com/NixOS/nixfmt/security

### nodejs

- **Business Justification**: JavaScript development and build processes
- **Data Classification**: public
- **Network Access**: outbound-required
- **Upstream**: https://nodejs.org/
- **Security Contact**: security@nodejs.org

### nodejs18

- **Business Justification**: Node.js v18 for legacy application support - MIGRATION REQUIRED
- **Data Classification**: public
- **Network Access**: outbound-required
- **Upstream**: https://nodejs.org/
- **Security Contact**: security@nodejs.org

### nodejs-24

- **Business Justification**: JavaScript runtime for frontend development and build processes
- **Data Classification**: public
- **Network Access**: outbound-required
- **Upstream**: https://nodejs.org
- **Security Contact**: security@nodejs.org

### npkill

- **Business Justification**: Clean up node_modules directories to save disk space in development environments
- **Data Classification**: public
- **Network Access**: none
- **Upstream**: https://github.com/voidcosmos/npkill
- **Security Contact**: https://github.com/voidcosmos/npkill/security

### php_84

- **Business Justification**: PHP runtime for web application development
- **Data Classification**: public
- **Network Access**: outbound-optional
- **Upstream**: https://www.php.net/
- **Security Contact**: security@php.net

### pnpm

- **Business Justification**: Efficient package management for JavaScript projects
- **Data Classification**: public
- **Network Access**: outbound-required
- **Upstream**: https://pnpm.io/
- **Security Contact**: https://github.com/pnpm/pnpm/security

### task

- **Business Justification**: Standardized task automation and build processes across projects
- **Data Classification**: public
- **Network Access**: none
- **Upstream**: https://taskfile.dev
- **Security Contact**: https://github.com/go-task/task/security

