{ pkgs }:

let
  basePnpm = import ./package.nix { inherit pkgs; };

in
pkgs.buildEnv {
  name = "pnpm-development-module";
  paths = [ basePnpm.packages ];

  pathsToLink = [
    "/bin"
    "/share/man"
    "/lib"
  ];

  meta = {
    category = "development-module";

    audit_reference = {
      base_file = "./package.nix";
      software_inventory = basePnpm.meta;
      compliance_info = basePnpm.meta.compliance;
    };

    inherit (basePnpm.meta)
      name
      description
      compliance
      tracking
      ;
  };

  passthru = {
    base = basePnpm;
    inherit (basePnpm.meta) compliance;
  };
}
