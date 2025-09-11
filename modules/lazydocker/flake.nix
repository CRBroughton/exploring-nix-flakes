{ pkgs }:

{
  package = pkgs.lazydocker;
  
  meta = {
    name = "lazydocker";
    description = "Simple terminal UI for Docker and Docker Compose";
    category = "container-tools";
    license = "MIT";
    upstream = "https://github.com/jesseduffield/lazydocker";
    security_contact = "https://github.com/jesseduffield/lazydocker/security";
    cve_monitoring = false;
    maintainer = "devops-team";
    maintainer_email = "devops@company.com";

    developer_features = [
      "docker-ui"
      "container-management"
      "log-viewing"
      "docker-compose-support"
    ];

    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "low";
    };

    tracking = {
      business_justification = "Improves developer productivity with Docker container management";
      data_classification = "public";
      network_access = "none";
    };

    audit_reference = {
      base_file = "unified-flake";
      compliance_info = "inline";
    };
  };
}
