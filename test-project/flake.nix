{
  description = "Test project using local git tools";

  inputs = {
    # Reference the parent directory (local path)
    dev-tools.url = "path:..";
    nixpkgs.follows = "dev-tools/nixpkgs";
  };

  outputs = { self, dev-tools, nixpkgs }:
    let
      system = "x86_64-linux"; # Change to your system
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          dev-tools.modules.${system}.git
        ];
        
        shellHook = ''
          echo "🔧 Development environment loaded!"
          echo ""
          echo "Git tools available:"
          echo "  git      - Standard git CLI"
          echo "  lazygit  - Terminal UI for git"
          echo "  gh       - GitHub CLI"
          echo "  gitui    - Alternative git TUI"
          echo "  delta    - Enhanced git diff viewer"
          echo ""
          echo "Try: lazygit or gitui for a nice interface"
        '';
      };
    };
}