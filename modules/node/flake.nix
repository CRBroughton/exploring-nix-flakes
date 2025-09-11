{ pkgs }:

{
  package = pkgs.nodejs_22;
  
  meta = {
    name = "nodejs";
    description = "Node.js JavaScript runtime environment";
    category = "javascript-runtime";
    license = "MIT";
    upstream = "https://nodejs.org/";
    security_contact = "security@nodejs.org";
    cve_monitoring = true;
    maintainer = "frontend-team";
    maintainer_email = "frontend@company.com";

    developer_features = [
      "javascript-runtime"
      "npm-package-manager"
      "native-modules"
      "debugging-tools"
      "performance-profiling"
      "async-programming"
    ];

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

    audit_reference = {
      base_file = "unified-flake";
      compliance_info = "inline";
    };
  };
}
