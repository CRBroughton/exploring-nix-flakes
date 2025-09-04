{ pkgs }:

let
  baseNode = import ./package.nix { inherit pkgs; };
  
in
pkgs.buildEnv {
  name = "node-18-development-module";
  paths = [ baseNode.packages ];
  
  pathsToLink = [ 
    "/bin" "/share/man" "/lib" "/include" "/share/doc"
  ];
  
  meta = {
    category = "development-module";
    
    audit_reference = {
      base_file = "./package.nix";
      software_inventory = baseNode.meta;
      compliance_info = baseNode.meta.compliance;
    };
    
    inherit (baseNode.meta) name description compliance tracking;
  };
  
  passthru = {
    base = baseNode;
    inherit (baseNode.meta) compliance;
  };
}