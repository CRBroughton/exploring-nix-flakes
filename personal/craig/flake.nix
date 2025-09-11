{
  description = "My global development environment";
  inputs = {
    # custom-modules.url = "github:CRBroughton/exploring-nix-flakes";
    custom-modules.url = "path:../../";
    # custom-modules.url = "git+ssh://git@github.com/CRBroughton/exploring-nix-flakes";
    nixpkgs.follows = "custom-modules/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      custom-modules,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        cpkgs = custom-modules.modules.${system};

        personalTools = pkgs.buildEnv {
          name = "personal-tools";
          paths = with pkgs; [
            nixfmt-rfc-style
            curl
            nixd
            direnv
            devenv
          ];
        };
      in
      {
        packages.default = pkgs.buildEnv {
          name = "my-global-dev-env";
          paths = [
            cpkgs.git
            cpkgs.jq
            cpkgs.lazygit
            cpkgs.lazydocker
            cpkgs.task
            cpkgs.ansible
            cpkgs.npkill
            personalTools
          ];
        };
      }
    );
}
