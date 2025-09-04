# Unified jq development module
{ pkgs }:

pkgs.buildEnv {
  name = "jq-development-module";
  paths = [ pkgs.jq ];
  pathsToLink = [
    "/bin"
    "/share/man"
    "/share/doc"
  ];

  meta = {
    # Core package information
    name = "jq";
    description = "jq development module for JSON processing";
    category = "development-module";
    license = "MIT";
    upstream = "https://jqlang.github.io/jq/";
    security_contact = "https://github.com/jqlang/jq/security";
    cve_monitoring = true;
    maintainer = "devops-team";
    maintainer_email = "devops@company.com";

    # Development features
    developer_features = [
      "json-formatting"
      "json-validation"
      "data-extraction"
      "array-operations"
      "format-conversion"
      "search-utilities"
    ];

    # Compliance information
    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "low";
    };

    # Usage tracking
    tracking = {
      business_justification = "JSON processing in development and automation scripts";
      data_classification = "public";
      network_access = "none";
    };

    # Audit reference - now unified
    audit_reference = {
      base_file = "unified-flake";
      compliance_info = "inline";
    };
  };
}
