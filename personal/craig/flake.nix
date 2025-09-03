{
  description = "My global development environment";
  
  inputs = {
    custom-modules.url = "github:CRBroughton/exploring-nix-flakes";
    nixpkgs.follows = "custom-modules/nixpkgs";
  };
  
  outputs = { self, custom-modules, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      
      personalTools = pkgs.buildEnv {
        name = "personal-tools";
        paths = with pkgs; [
          jq
          nixfmt-rfc-style
          curl
        ];
      };
      
    in {
      packages.${system}.default = pkgs.buildEnv {
        name = "my-global-dev-env";
        paths = [
          custom-modules.modules.${system}.git
          custom-modules.modules.${system}.lazygit
          personalTools
        ];
      };
    };
}