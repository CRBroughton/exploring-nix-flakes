# Unified Node.js development module
{ pkgs }:

pkgs.buildEnv {
  name = "node-development-module";
  paths = [ pkgs.nodejs_22 ];
  pathsToLink = [
    "/bin"
    "/share/man"
    "/lib"
    "/include"
    "/share/doc"
  ];

  meta = {
    # Core package information
    name = "nodejs";
    description = "Node.js development module with JavaScript runtime";
    category = "development-module";
    license = "MIT";
    upstream = "https://nodejs.org/";
    security_contact = "security@nodejs.org";
    cve_monitoring = true;
    maintainer = "frontend-team";
    maintainer_email = "frontend@company.com";

    # Development features
    developer_features = [
      "javascript-runtime"
      "npm-package-manager"
      "native-modules"
      "debugging-tools"
      "performance-profiling"
      "async-programming"
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
      business_justification = "JavaScript development and build processes";
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
