{
  pkgs,
  lib ? pkgs.lib,
}:

let
  # Auto-discover modules from filesystem
  discoverModules =
    modulesPath:
    let
      moduleNames = builtins.attrNames (builtins.readDir modulesPath);

      # Helper function to import a module
      importModule = name: {
        name = name;
        module = import (modulesPath + "/${name}/flake.nix");
        package = import (modulesPath + "/${name}/package.nix");
      };

      # Import all modules automatically
      allModuleData = map importModule moduleNames;

    in
    {
      # Raw module data for further processing
      moduleData = allModuleData;

      # Convert to attribute sets for flake outputs
      toModules =
        pkgs:
        builtins.listToAttrs (
          map (m: {
            name = m.name;
            value = m.module { inherit pkgs; };
          }) allModuleData
        );

      toPackages =
        pkgs:
        builtins.listToAttrs (
          map (m: {
            name = "${m.name}-base";
            value = (m.package { inherit pkgs; }).packages;
          }) allModuleData
        );

      toCompliance =
        pkgs:
        builtins.listToAttrs (
          map (m: {
            name = m.name;
            value = (m.package { inherit pkgs; }).meta;
          }) allModuleData
        );

      # For report generation
      toModuleList = pkgs: map (m: m.package { inherit pkgs; }) allModuleData;

      # Utility functions
      getModuleNames = map (m: m.name) allModuleData;

      getModuleCount = builtins.length allModuleData;

      # Filter modules by criteria
      filterModules =
        pkgs: predicate: builtins.filter predicate (map (m: m.package { inherit pkgs; }) allModuleData);

      # Get modules by category
      getModulesByCategory =
        pkgs: category:
        builtins.filter (mod: mod.meta.category == category) (
          map (m: m.package { inherit pkgs; }) allModuleData
        );
    };

in
{
  inherit discoverModules;
}
