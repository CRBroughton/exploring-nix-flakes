{ pkgs }:

let
  baseJq = import ./package.nix { inherit pkgs; };

in
pkgs.buildEnv {
  name = "jq-development-module";
  paths = [ baseJq.packages ];
  
  pathsToLink = [ "/bin" "/share/man" "/share/doc" ];
  
  meta = {
    category = "development-module";
    
    audit_reference = {
      base_file = "./package.nix";
      software_inventory = baseJq.meta;
      compliance_info = baseJq.meta.compliance;
    };
    
    developer_features = [
      "json-formatting" "json-validation" "data-extraction" 
      "array-operations" "format-conversion" "search-utilities"
    ];
    
    inherit (baseJq.meta) name description compliance tracking;
  };
  
  passthru = {
    base = baseJq;
    inherit (baseJq.meta) compliance;
  };
}