{ pkgs }:

let
  baseLazyGit = import ./package.nix { inherit pkgs; };

in
pkgs.buildEnv {
  name = "lazygit-module";
  paths = [ baseLazyGit.packages ];

  pathsToLink = [
    "/bin"
    "/share/man"
    "/share/bash-completion"
    "/share/zsh"
  ];

  meta = {
    category = "development-module";

    audit_reference = {
      base_file = "./package.nix";
      software_inventory = baseLazyGit.meta;
      compliance_info = baseLazyGit.meta.compliance;
    };

    inherit (baseLazyGit.meta)
      name
      description
      compliance
      tracking
      ;
  };

  passthru = {
    base = baseLazyGit;

    inherit (baseLazyGit.meta) compliance;
  };
}
