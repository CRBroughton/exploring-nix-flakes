# Unified Laravel development module
{ pkgs }:

pkgs.buildEnv {
  name = "laravel-development-module";
  paths = [ pkgs.laravel ];
  pathsToLink = [
    "/bin"
    "/share"
  ];

  meta = {
    # Core package information
    name = "laravel";
    description = "Laravel development module with project scaffolding";
    category = "development-module";
    license = "MIT";
    upstream = "https://laravel.com/";
    security_contact = "taylor@laravel.com";
    cve_monitoring = false;
    maintainer = "backend-team";
    maintainer_email = "backend@company.com";

    # Development features
    developer_features = [
      "project-scaffolding"
      "artisan-shortcuts"
      "code-generation"
    ];

    # Compliance information
    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "low";
      notes = "CLI installer tool only";
    };

    # Usage tracking
    tracking = {
      business_justification = "Laravel project scaffolding and CLI tools";
      data_classification = "public";
      network_access = "outbound-required";
    };

    # Audit reference - now unified
    audit_reference = {
      base_file = "unified-flake";
      compliance_info = "inline";
    };
  };
}
