{ pkgs }:

let
  baseLaravel = import ./package.nix { inherit pkgs; };

in
pkgs.buildEnv {
  name = "laravel-development-module";
  paths = [ baseLaravel.packages ];
  pathsToLink = [
    "/bin"
    "/share"
  ];

  meta = {
    category = "development-module";
    developer_features = [
      "project-scaffolding"
      "artisan-shortcuts"
      "code-generation"
    ];
    inherit (baseLaravel.meta)
      name
      description
      compliance
      tracking
      ;
  };

  passthru = {
    base = baseLaravel;
    inherit (baseLaravel.meta) compliance;
  };
}
