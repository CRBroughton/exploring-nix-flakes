{ pkgs }:

let
  baseComposer = import ./package.nix { inherit pkgs; };

in
pkgs.buildEnv {
  name = "composer-development-module";
  paths = [ baseComposer.packages ];
  pathsToLink = [
    "/bin"
    "/share/man"
  ];

  meta = {
    category = "development-module";
    developer_features = [
      "dependency-management"
      "autoloader-optimization"
      "security-audit"
    ];
    inherit (baseComposer.meta)
      name
      description
      compliance
      tracking
      ;
  };

  passthru = {
    base = baseComposer;
    inherit (baseComposer.meta) compliance;
  };
}
