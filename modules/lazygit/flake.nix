{ pkgs }:

let
  basePackage = import ./package.nix { inherit pkgs; };
 
in
pkgs.buildEnv {
  name = "lazygit-module";
  paths = [ basePackage.packages ];
  
  pathsToLink = [ "/bin" "/share/man" "/share/bash-completion" "/share/zsh" ];
  
  meta = {
    category = "development-module";
    
    audit_reference = {
      base_file = "./package.nix";
      software_inventory = basePackage.meta;
      compliance_info = basePackage.meta.compliance;
    };
    
    inherit (basePackage.meta) name description compliance tracking;
  };
  
  passthru = {
    base = basePackage;
    
    inherit (basePackage.meta) compliance;
  };
}