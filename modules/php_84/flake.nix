{ pkgs }:

let
  basePhp = import ./package.nix { inherit pkgs; };
  
in
pkgs.buildEnv {
  name = "php84-development-module";
  paths = [ basePhp.packages ];
  pathsToLink = [ "/bin" "/share/man" "/lib" "/include" "/share/doc" ];
  
  meta = {
    category = "development-module";
    developer_features = [ "dev-server" "syntax-checking" "repl" "config-inspection" ];
    inherit (basePhp.meta) name description compliance tracking;
  };
  
  passthru = {
    base = basePhp;
    inherit (basePhp.meta) compliance;
  };
}