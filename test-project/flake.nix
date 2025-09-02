{
  description = "Test project using local git tools";

  inputs = {
    tillo-modules.url = "path:..";
    nixpkgs.follows = "tillo-modules/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      tillo-modules,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        gitLib = tillo-modules.modules.${system}.git;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            gitLib
            pkgs.nixfmt-rfc-style
          ];

          shellHook = ''
            echo "🔧 Test Project Development Environment loaded!"
            echo "System: ${system}"
            echo ""

            # Inject git utility functions
            ${gitLib.functions}

            # Project-specific functions
            setup() {
              echo "Setting up test project..."
              git init 2>/dev/null || echo "Git repo already initialized"
              echo "Test project setup complete!"
            }

            test-git() {
              echo "Testing git functions..."
              echo "Git version: $(git --version)"
              echo "Lazygit available: $(which lazygit)"
              echo "Available git shortcuts: st, co, br, ci, lg, quick-commit"
            }

            demo() {
              echo "=== GIT FUNCTION DEMO ==="
              echo "Try these commands:"
              echo "  st                    # git status"
              echo "  quick-commit 'test'   # add all and commit"
              echo "  lg                    # pretty log"
              echo "  lg-ui                 # open lazygit"
              echo "  new-branch feature/x  # create new branch"
            }

            help() {
              echo "=== TEST PROJECT COMMANDS ==="
              echo "  setup      - Initialize test project"
              echo "  test-git   - Test git functionality"
              echo "  demo       - Show git function examples"
              echo ""
              ${gitLib.help}
            }

            echo "Available commands: setup, test-git, demo"
            echo "Git shortcuts loaded: st, co, br, ci, lg, quick-commit, lg-ui"
            echo "Type 'help' for all available commands"
          '';
        };
      }
    );
}
