{ pkgs }:

{
  package = pkgs.beamMinimal27Packages.elixir;
  
  meta = {
    name = "elixir";
    description = "Dynamic, functional language for building scalable applications";
    category = "programming-language";
    license = "Apache-2.0";
    upstream = "https://elixir-lang.org";
    security_contact = "https://github.com/elixir-lang/elixir/security";
    cve_monitoring = false;
    maintainer = "backend-team";
    maintainer_email = "backend@company.com";

    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "low";
      notes = "Stable functional programming language";
    };

    tracking = {
      business_justification = "Backend development for distributed and fault-tolerant applications";
      data_classification = "public";
      network_access = "outbound-optional";
    };

  };
}
