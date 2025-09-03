{
  description = "Full-stack JavaScript project";
  
  inputs = {
    dev-tools.url = "path:..";
    nixpkgs.follows = "dev-tools/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  
  outputs = { self, dev-tools, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        gitLib = dev-tools.modules.${system}.git;
        nodeLib = dev-tools.modules.${system}.node;
        pnpmLib = dev-tools.modules.${system}.pnpm;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            gitLib
            nodeLib
            pnpmLib
          ];
          
          shellHook = ''
            echo "🚀 JavaScript Development Environment loaded!"
            echo ""
            
            # Inject all utility functions
            ${gitLib.functions}
            
            # Project-specific functions
            setup() {
              echo "Setting up JavaScript project..."
              git init 2>/dev/null || echo "Git repo already initialized"
              init-node
              echo "Project setup complete!"
            }
            
            info() {
              echo "=== ENVIRONMENT INFO ==="
              node-info
              pnpm-info
              echo ""
              if [ -f package.json ]; then
                pkg-info
              fi
            }
            
            help() {
              echo "=== PROJECT COMMANDS ==="
              echo "  setup - Initialize project"
              echo "  info  - Show environment info"
              echo ""
              echo "=== NODE.JS ==="
              echo "=== GIT ==="
              ${gitLib.help}
            }
            
            echo "Available: Node.js $(node --version), pnpm $(pnpm --version)"
            echo "Quick start: setup, add react, pdev"
            echo "Type 'help' for all commands"
          '';
        };
      });
}