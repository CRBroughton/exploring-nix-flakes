{ pkgs }:

{
  package = pkgs.laravel;
  
  meta = {
    name = "laravel";
    description = "Laravel application installer and project scaffolding tool";
    category = "web-framework";
    license = "MIT";
    upstream = "https://laravel.com/";
    security_contact = "taylor@laravel.com";
    cve_monitoring = false;
    maintainer = "backend-team";
    maintainer_email = "backend@company.com";

    developer_features = [
      "project-scaffolding"
      "artisan-shortcuts"
      "code-generation"
    ];

    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "low";
      notes = "CLI installer tool only";
    };

    tracking = {
      business_justification = "Laravel project scaffolding and CLI tools";
      data_classification = "public";
      network_access = "outbound-required";
    };

    audit_reference = {
      base_file = "unified-flake";
      compliance_info = "inline";
    };
  };
}
