{ pkgs }:

{
  package = pkgs.pnpm;
  
  meta = {
    name = "pnpm";
    description = "Fast, disk space efficient package manager";
    category = "package-manager";
    license = "MIT";
    upstream = "https://pnpm.io/";
    security_contact = "https://github.com/pnpm/pnpm/security";
    cve_monitoring = true;
    maintainer = "frontend-team";
    maintainer_email = "frontend@company.com";

    developer_features = [
      "package-management"
      "workspace-support"
      "symlink-efficiency"
      "lockfile-management"
      "caching-optimization"
      "monorepo-support"
    ];

    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "medium";
      notes = "Network access required for package registry";
    };

    tracking = {
      business_justification = "Efficient package management for JavaScript projects";
      data_classification = "public";
      network_access = "outbound-required";
    };

    audit_reference = {
      base_file = "unified-flake";
      compliance_info = "inline";
    };
  };
}
