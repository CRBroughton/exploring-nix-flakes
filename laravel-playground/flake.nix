{
  description = "Elixir demo";

  inputs = {
    custom-pkgs.url = "path:../";
    nixpkgs.follows = "custom-pkgs/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      custom-pkgs,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        cpkgs = custom-pkgs.modules.${system};
        cpkgsShell = custom-pkgs.lib.${system}.mkShell;
      in
      {
        devShells.default = cpkgsShell {
          buildInputs = with cpkgs; [
            git
            php_84
            composer
            laravel
          ];
        };
      }
    );
}
