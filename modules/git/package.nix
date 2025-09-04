# Pure git package - IT auditable
{ pkgs }:

{
  # Single dependency: git
  packages = pkgs.buildEnv {
    name = "git-package";
    paths = [ pkgs.git ];
    pathsToLink = [
      "/bin"
      "/share/man"
      "/share/bash-completion"
      "/share/zsh"
      "/share/fish"
      "/share/git-core"
      "/libexec"
    ];
  };

  # Simplified metadata for single dependency
  meta = {
    name = "git";
    description = "Distributed version control system";
    category = "version-control";
    license = "GPL-2.0";
    upstream = "https://git-scm.com/";
    security_contact = "security@git-scm.com";
    cve_monitoring = true;
    maintainer = "devops-team";
    maintainer_email = "devops@company.com";

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
      business_justification = "Essential for version control in software development";
      data_classification = "public";
      network_access = "outbound-only";
    };
  };
}
