{ pkgs }:

{
  package = pkgs.php84;
  
  meta = {
    name = "php_84";
    description = "PHP 8.4 scripting language runtime";
    category = "programming-language";
    license = "PHP-3.01";
    upstream = "https://www.php.net/";
    security_contact = "security@php.net";
    cve_monitoring = true;
    maintainer = "backend-team";
    maintainer_email = "backend@company.com";

    developer_features = [
      "dev-server"
      "syntax-checking"
      "repl"
      "config-inspection"
      "debugging"
      "profiling"
    ];

    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "medium";
    };

    tracking = {
      business_justification = "PHP runtime for web application development";
      data_classification = "public";
      network_access = "outbound-optional";
    };

    audit_reference = {
      base_file = "unified-flake";
      compliance_info = "inline";
    };
  };
}
