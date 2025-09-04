# Unified PHP 8.4 development module
{ pkgs }:

pkgs.buildEnv {
  name = "php84-development-module";
  paths = [ pkgs.php84 ];
  pathsToLink = [
    "/bin"
    "/share/man"
    "/lib"
    "/include"
    "/share/doc"
  ];

  meta = {
    # Core package information
    name = "php_84";
    description = "PHP 8.4 development module with scripting language";
    category = "development-module";
    license = "PHP-3.01";
    upstream = "https://www.php.net/";
    security_contact = "security@php.net";
    cve_monitoring = true;
    maintainer = "backend-team";
    maintainer_email = "backend@company.com";

    # Development features
    developer_features = [
      "dev-server"
      "syntax-checking"
      "repl"
      "config-inspection"
      "debugging"
      "profiling"
    ];

    # Compliance information
    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "medium";
    };

    # Usage tracking
    tracking = {
      business_justification = "PHP runtime for web application development";
      data_classification = "public";
      network_access = "outbound-optional";
    };

    # Audit reference - now unified
    audit_reference = {
      base_file = "unified-flake";
      compliance_info = "inline";
    };
  };
}
