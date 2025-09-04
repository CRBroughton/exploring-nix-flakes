{ pkgs }:

{
  packages = pkgs.buildEnv {
    name = "jq-package";
    paths = [ pkgs.jq ];
    pathsToLink = [
      "/bin"
      "/share/man"
      "/share/doc"
    ];
  };

  meta = {
    name = "jq";
    description = "Command-line JSON processor";
    category = "developer-tools";
    license = "MIT";
    upstream = "https://jqlang.github.io/jq/";
    security_contact = "https://github.com/jqlang/jq/security";
    cve_monitoring = true;
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
      business_justification = "JSON processing in development and automation scripts";
      data_classification = "public";
      network_access = "none";
    };
  };
}
