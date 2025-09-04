# Software Inventory Report

Generated on: 2025-09-02 20:47:58 UTC

## Software Inventory

| Name | Description | Category | License | CVE Monitoring | Risk Level |
|------|-------------|----------|---------|----------------|------------|
| composer | Composer development module with PHP dependency management | development-module | MIT | ✅ | medium |
| git | Git development module with utility functions | development-module | GPL-2.0 | ✅ | low |
| jq | jq development module for JSON processing | development-module | MIT | ✅ | low |
| laravel | Laravel development module with project scaffolding | development-module | MIT | ❌ | low |
| lazygit | Lazygit development module with terminal UI for git | development-module | MIT | ❌ | low |
| nodejs | Node.js development module with JavaScript runtime | development-module | MIT | ✅ | medium |
| nodejs18 | Node.js 18 development module (EOL - legacy support only) | development-module | MIT | ❌ | high |
| php_84 | PHP 8.4 development module with scripting language | development-module | PHP-3.01 | ✅ | medium |
| pnpm | pnpm development module with fast package management | development-module | MIT | ✅ | medium |

## Compliance Status

| Name | Approved | Approved By | Last Audit | Next Audit | Maintainer |
|------|----------|-------------|------------|------------|------------|
| composer | ✅ | security-team | 2024-01-15 | 2024-07-15 | backend-team |
| git | ✅ | security-team | 2024-01-15 | 2024-07-15 | devops-team |
| jq | ✅ | security-team | 2024-01-15 | 2024-07-15 | devops-team |
| laravel | ✅ | security-team | 2024-01-15 | 2024-07-15 | backend-team |
| lazygit | ✅ | security-team | 2024-01-15 | 2024-07-15 | devops-team |
| nodejs | ✅ | security-team | 2024-01-15 | 2024-07-15 | frontend-team |
| nodejs18 | ❌ |  |  | 2024-03-15 | frontend-team |
| php_84 | ✅ | security-team | 2024-01-15 | 2024-07-15 | backend-team |
| pnpm | ✅ | security-team | 2024-01-15 | 2024-07-15 | frontend-team |

## Summary

- **Total Modules**: 9
- **Approved Modules**: 8
- **CVE Monitored**: 6
- **High Risk**: 1

## Module Details

### composer

- **Business Justification**: PHP dependency management
- **Data Classification**: public
- **Network Access**: outbound-required
- **Upstream**: https://getcomposer.org/
- **Security Contact**: security@packagist.org

### git

- **Business Justification**: Essential for version control in software development
- **Data Classification**: public
- **Network Access**: outbound-only
- **Upstream**: https://git-scm.com/
- **Security Contact**: security@git-scm.com

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

### lazygit

- **Business Justification**: Improves developer productivity with git operations
- **Data Classification**: public
- **Network Access**: none
- **Upstream**: https://github.com/jesseduffield/lazygit
- **Security Contact**: https://github.com/jesseduffield/lazygit/security

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

