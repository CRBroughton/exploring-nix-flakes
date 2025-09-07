# Unified Composer development module
{ pkgs }:

pkgs.buildEnv {
  name = "composer-development-module";
  paths = [ pkgs.php84Packages.composer ];
  pathsToLink = [
    "/bin"
    "/share/man"
  ];

  meta = {
    # Core package information
    name = "composer";
    description = "Composer development module with PHP dependency management";
    category = "development-module";
    license = "MIT";
    upstream = "https://getcomposer.org/";
    security_contact = "security@packagist.org";
    cve_monitoring = true;
    maintainer = "backend-team";
    maintainer_email = "backend@company.com";

    # Development features
    developer_features = [
      "dependency-management"
      "autoloader-optimization"
      "security-audit"
    ];

    # Compliance information
    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "medium";
      notes = "Network access required for package downloads";
    };

    # Usage tracking
    tracking = {
      business_justification = "PHP dependency management";
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
