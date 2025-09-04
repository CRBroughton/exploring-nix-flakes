# Unified Lazygit development module
{ pkgs }:

pkgs.buildEnv {
  name = "lazygit-development-module";
  paths = [ pkgs.lazygit ];
  pathsToLink = [
    "/bin"
    "/share/man"
    "/share/bash-completion"
    "/share/zsh"
  ];

  meta = {
    # Core package information
    name = "lazygit";
    description = "Lazygit development module with terminal UI for git";
    category = "development-module";
    license = "MIT";
    upstream = "https://github.com/jesseduffield/lazygit";
    security_contact = "https://github.com/jesseduffield/lazygit/security";
    cve_monitoring = false;
    maintainer = "devops-team";
    maintainer_email = "devops@company.com";

    # Development features
    developer_features = [
      "git-ui"
      "branch-management"
      "commit-history"
      "merge-conflicts"
      "staging-operations"
      "repository-visualization"
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
      business_justification = "Improves developer productivity with git operations";
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
