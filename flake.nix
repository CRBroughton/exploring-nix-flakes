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
    flake-utils.lib.eachDefaultSystem (
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

        # Export discovery utilities for advanced usage
        lib = {
          inherit moduleDiscovery reports;

          # Convenience functions
          getModuleNames = discovered.getModuleNames;
          getModuleCount = discovered.getModuleCount;
          getDevTools = discovered.getModulesByCategory pkgs "developer-tools";
          getVersionControl = discovered.getModulesByCategory pkgs "version-control";

          # Customised mkShell to drop us into the Fish shell when running 'nix develop'
          mkShell =
            args:
            pkgs.mkShell (
              args
              // {
                shellHook = (args.shellHook or "") + ''
                  # Check if fish is available and we're not already in fish
                  if command -v fish >/dev/null 2>&1 && [ "$0" != "fish" ]; then
                    exec fish
                  fi
                '';
              }
            );
        };
      }
    );
}
