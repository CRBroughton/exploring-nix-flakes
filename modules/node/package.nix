{ pkgs }:

{
  packages = pkgs.buildEnv {
    name = "node-package";
    paths = [ pkgs.nodejs_22 ];
    pathsToLink = [
      "/bin"
      "/share/man"
      "/lib"
      "/include"
      "/share/doc"
    ];
  };

  meta = {
    name = "nodejs";
    description = "JavaScript runtime built on Chrome's V8 JavaScript engine";
    category = "javascript-runtime";
    license = "MIT";
    upstream = "https://nodejs.org/";
    security_contact = "security@nodejs.org";
    cve_monitoring = true;
    maintainer = "frontend-team";
    maintainer_email = "frontend@company.com";

    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "medium";
      notes = "Network access required for package downloads";
    };

    tracking = {
      business_justification = "JavaScript development and build processes";
      data_classification = "public";
      network_access = "outbound-required";
    };
  };
}
