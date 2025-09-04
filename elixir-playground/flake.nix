{
  description = "Elixir demo";

  inputs = {
    dev-tools.url = "path:../";
    nixpkgs.follows = "dev-tools/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      dev-tools,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            dev-tools.modules.${system}.git
            dev-tools.modules.${system}.elixir
          ];
        };
      }
    );
}
