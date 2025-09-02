{ pkgs }:

pkgs.buildEnv {
    name = "git";
    paths = with pkgs; [
        git
        lazygit
    ];

    meta = {
        description = "Git";
        category = "tooling";
    };
}