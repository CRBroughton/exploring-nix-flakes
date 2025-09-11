{ pkgs }:

{
  package = pkgs.php84Packages.composer;
  
  meta = {
    name = "composer";
    description = "PHP dependency manager";
    category = "package-manager";
    license = "MIT";
    upstream = "https://getcomposer.org/";
    security_contact = "security@packagist.org";
    cve_monitoring = true;
    maintainer = "backend-team";
    maintainer_email = "backend@company.com";

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
      business_justification = "PHP dependency management";
      data_classification = "public";
      network_access = "outbound-required";
    };

  };
}
