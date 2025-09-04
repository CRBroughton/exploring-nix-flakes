# Unified Node.js 18 development module
{ pkgs }:

let
  # Pin to nixpkgs revision that has Node.js 18
  node18Pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/0bd7f95e4588643f2c2d403b38d8a2fe44b0fc73.tar.gz";
    sha256 = "0vx2pw69if88nkfh74bf1a8s5497n2nv7wydmvmqh5qh00fsahvq"; # Nix will tell you the correct hash on first run
    # Nix will tell you the correct hash on first run
  }) { system = pkgs.system; };
in

pkgs.buildEnv {
  name = "node-18-development-module";
  paths = [ node18Pkgs.nodejs_18 ]; # Use the pinned nixpkgs
  pathsToLink = [
    "/bin"
    "/share/man"
    "/lib"
    "/include"
    "/share/doc"
  ];

  meta = {
    # Core package information
    name = "nodejs18";
    description = "Node.js 18 development module (EOL - legacy support only)";
    category = "development-module";
    license = "MIT";
    upstream = "https://nodejs.org/";
    security_contact = "security@nodejs.org";
    cve_monitoring = false; # EOL package
    maintainer = "frontend-team";
    maintainer_email = "frontend@company.com";

    # Development features
    developer_features = [
      "javascript-runtime-legacy"
      "npm-package-manager-legacy"
      "native-modules"
      "debugging-tools"
      "migration-support"
    ];

    # Compliance information
    compliance = {
      approved = false; # EOL software needs special approval
      approval_date = "";
      approved_by = "";
      last_audit = "";
      next_audit = "2024-03-15";
      risk_level = "high";
      notes = "END-OF-LIFE: Node.js 18 reached EOL. Use only for legacy support with security mitigations.";
    };

    # Usage tracking
    tracking = {
      business_justification = "Node.js v18 for legacy application support - MIGRATION REQUIRED";
      data_classification = "public";
      network_access = "outbound-required";
    };

    # Audit reference - now unified
    audit_reference = {
      base_file = "unified-flake";
      compliance_info = "inline";
    };
  };
}
