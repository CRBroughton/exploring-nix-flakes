{
  # Description of this flake - creates a global development environment
  description = "My global development environment";

  # Input dependencies for this flake
  inputs = {
    # Custom modules - Use local path when testing changes, switch to repo for your PR
    # custom-modules.url = "github:CRBroughton/exploring-nix-flakes";
    custom-modules.url = "path:../../";

    # Use the same nixpkgs version that custom-modules is using for consistency
    nixpkgs.follows = "custom-modules/nixpkgs";

    # Utility functions for working with multiple systems (x86_64-linux, aarch64-darwin, etc.)
    flake-utils.url = "github:numtide/flake-utils";
  };

  # Define the outputs this flake provides
  outputs =
    {
      self, # Reference to this flake
      custom-modules, # Our custom modules input
      nixpkgs, # The Nix packages collection
      flake-utils, # System utilities
    }:
    # Generate outputs for each default system (Linux, macOS, etc.)
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        # Get the nixpkgs package set for the current system
        pkgs = nixpkgs.legacyPackages.${system};

        # Get our custom packages for the current system
        cpkgs = custom-modules.modules.${system};

        # Create a collection of personal development tools
        personalTools = pkgs.buildEnv {
          name = "personal-tools";
          paths = with pkgs; [
            nixfmt-rfc-style # Nix code formatter following RFC style
            curl # Command-line HTTP client
            nixd # Nix language server for IDE support
            direnv # Environment variable management per directory
          ];
        };
      in
      {
        # Default package output - the main development environment
        packages.default = pkgs.buildEnv {
          name = "my-global-dev-env";
          paths = [
            # Git configuration from custom modules
            cpkgs.git

            # JSON processor from custom modules
            cpkgs.jq

            # Terminal UI for Git from custom modules
            cpkgs.lazygit

            # Include all the personal tools defined above
            personalTools
          ];
        };
      }
    );
}

# Installation and Usage Commands:
#
# Install from remote repository (production use):
# nix profile add github:CRBroughton/exploring-nix-flakes?dir=profiles/craig
#
# Install local development version:
# cd exploring-nix-flakes
# nix profile add ./profiles/craig#default
#
# Remove and reinstall local version (one-liner):
# nix profile remove profiles/craig && nix profile add ./profiles/craig#default
#
# Update the remote flake:
# nix flake update --flake github:CRBroughton/exploring-nix-flakes
#
# Update local flake inputs:
# nix flake update dev-tools
