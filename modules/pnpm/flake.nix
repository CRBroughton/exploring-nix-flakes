# Unified pnpm development module
{ pkgs }:

pkgs.buildEnv {
  name = "pnpm-development-module";
  paths = [ pkgs.pnpm ];
  pathsToLink = [
    "/bin"
    "/share/man"
    "/lib"
  ];

  meta = {
    # Core package information
    name = "pnpm";
    description = "pnpm development module with fast package management";
    category = "development-module";
    license = "MIT";
    upstream = "https://pnpm.io/";
    security_contact = "https://github.com/pnpm/pnpm/security";
    cve_monitoring = true;
    maintainer = "frontend-team";
    maintainer_email = "frontend@company.com";

    # Development features
    developer_features = [
      "package-management"
      "workspace-support"
      "symlink-efficiency"
      "lockfile-management"
      "caching-optimization"
      "monorepo-support"
    ];

    # Compliance information
    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "medium";
      notes = "Network access required for package registry";
    };

    # Usage tracking
    tracking = {
      business_justification = "Efficient package management for JavaScript projects";
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
