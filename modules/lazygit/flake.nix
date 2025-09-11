{ pkgs }:

{
  package = pkgs.lazygit;
  
  meta = {
    name = "lazygit";
    description = "Simple terminal UI for git commands";
    category = "version-control";
    license = "MIT";
    upstream = "https://github.com/jesseduffield/lazygit";
    security_contact = "https://github.com/jesseduffield/lazygit/security";
    cve_monitoring = false;
    maintainer = "devops-team";
    maintainer_email = "devops@company.com";

    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "low";
    };

    tracking = {
      business_justification = "Improves developer productivity with git operations";
      data_classification = "public";
      network_access = "none";
    };

  };
}
