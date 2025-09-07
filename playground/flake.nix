{
  description = "Full-stack JavaScript project";

  inputs = {
    dev-tools.url = "github:CRBroughton/exploring-nix-flakes";
    nixpkgs.follows = "dev-tools/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      dev-tools,
      nixpkgs,
      flake-utils,
      ...
    }:
    dev-tools.lib.mkDevShell dev-tools [
      "git"
      "node"
      "pnpm"
      "lazygit"
    ];
}
