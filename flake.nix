{
  description = "Development tools collection";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    {
      # Ultra-simple dev shell creator - eliminates playground boilerplate
      lib = {
        # Function that takes dev-tools input and module list, returns complete flake outputs
        mkDevShell =
          modules: moduleNames:
          flake-utils.lib.eachDefaultSystem (
            system:
            let
              systemPkgs = nixpkgs.legacyPackages.${system};
              selectedModules = map (name: modules.modules.${system}.${name}) moduleNames;
            in
            {
              devShells.default = systemPkgs.mkShell {
                buildInputs = selectedModules;
                shellHook = systemPkgs.lib.concatMapStrings (
                  module: systemPkgs.lib.optionalString (module ? functions) module.functions + "\n"
                ) selectedModules;
              };
            }
          );
      };

      # Templates for creating new modules
      templates = {
        default = {
          path = ./templates;
          description = "Unified module template";
        };
      };
    }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # Import our discovery and reporting libraries
        moduleDiscovery = import ./lib/discover-modules.nix { inherit pkgs; };
        reports = import ./lib/reports.nix { inherit pkgs; };

        # Discover all modules
        discovered = moduleDiscovery.discoverModules ./modules;

        # Get all module data
        allModules = discovered.toModuleList pkgs;

      in
      {
        # Export discovered modules
        modules = discovered.toModules pkgs;

        # Export base packages
        packages = (discovered.toPackages pkgs) // {
          # Add reports
          generateInventory = reports.generateJsonReport allModules;
          generateInventoryMd = reports.generateMarkdownReport allModules;
        };

        # Export compliance data
        compliance = discovered.toCompliance pkgs;

        # Export system-specific discovery utilities
        utils = {
          inherit moduleDiscovery reports;

          # Convenience functions
          getModuleNames = discovered.getModuleNames;
          getModuleCount = discovered.getModuleCount;
          getDevTools = discovered.getModulesByCategory pkgs "developer-tools";
          getVersionControl = discovered.getModulesByCategory pkgs "version-control";
        };
      }
    );
}
