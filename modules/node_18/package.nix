{ pkgs }:

let
  # Pin to nixpkgs revision that has Node.js 18
  node18Pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/0bd7f95e4588643f2c2d403b38d8a2fe44b0fc73.tar.gz";
    sha256 = ""; # Nix will tell you the correct hash on first run
     # Nix will tell you the correct hash on first run
  }) { system = pkgs.system; };
in
{
  packages = pkgs.buildEnv {
    name = "node18-package";
    paths = [ node18Pkgs.nodejs_18 ];  # Use the pinned nixpkgs
    pathsToLink = [ "/bin" "/share/man" "/lib" "/include" "/share/doc" ];
  };

  meta = {
    name = "nodejs18";
    description = "Node.js v18.20.6 LTS JavaScript runtime (pinned revision)";
    category = "javascript-runtime";
    license = "MIT";
    upstream = "https://nodejs.org/";
    security_contact = "security@nodejs.org";
    cve_monitoring = false;  # EOL package
    maintainer = "frontend-team";
    maintainer_email = "frontend@company.com";
    
    compliance = {
      approved = false;  # EOL software needs special approval
      approval_date = "";
      approved_by = "";
      last_audit = "";
      next_audit = "2024-03-15";
      risk_level = "high";
      notes = "END-OF-LIFE: Node.js 18 reached EOL. Use only for legacy support with security mitigations.";
    };
    
    tracking = {
      business_justification = "Node.js v18 for legacy application support - MIGRATION REQUIRED";
      data_classification = "public";
      network_access = "outbound-required";
    };
  };
}