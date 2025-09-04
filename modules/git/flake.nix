# Enhanced module that adds developer functions to base packages
{ pkgs }:

let
  # Import the base packages
  baseGit = import ./package.nix { inherit pkgs; };

  # Git utility functions that get injected into shellHook
  gitFunctions = ''
    # Git aliases as functions (faster than global config)
    st() { git status "$@"; }
    co() { git checkout "$@"; }
    br() { git branch "$@"; }
    ci() { git commit "$@"; }
    lg() { git log --oneline --graph --decorate "$@"; }
    ll() { git log --oneline --graph --decorate --all "$@"; }
    unstage() { git reset HEAD "$@"; }
    last() { git log -1 HEAD "$@"; }

    # Additional git utilities
    quick-commit() {
      if [ -z "$1" ]; then
        echo "Usage: quick-commit <message>"
        return 1
      fi
      git add . && git commit -m "$1"
    }

    push-current() {
      local branch=$(git branch --show-current)
      git push origin "$branch" "$@"
    }

    new-branch() {
      if [ -z "$1" ]; then
        echo "Usage: new-branch <branch-name>"
        return 1
      fi
      git checkout -b "$1"
    }

    clean-branches() {
      echo "Cleaning up merged branches..."
      git branch --merged | grep -v "\*\|main\|master\|develop" | xargs -n 1 git branch -d
    }

    # Lazygit wrapper
    lg-ui() { lazygit "$@"; }
  '';

  gitHelp = ''
    echo "Git utilities available:"
    echo "  st <args>           - git status"
    echo "  co <args>           - git checkout" 
    echo "  br <args>           - git branch"
    echo "  ci <args>           - git commit"
    echo "  lg <args>           - git log --oneline --graph"
    echo "  ll <args>           - git log --all --graph"
    echo "  unstage <files>     - git reset HEAD"
    echo "  last                - show last commit"
    echo ""
    echo "Advanced git functions:"
    echo "  quick-commit <msg>  - add all and commit"
    echo "  push-current        - push current branch" 
    echo "  new-branch <name>   - create and checkout new branch"
    echo "  clean-branches      - delete merged branches"
    echo "  lg-ui               - open lazygit interface"
  '';

in
# Return the enhanced package with functions
pkgs.buildEnv {
  name = "git-development-module";
  paths = [ baseGit.packages ];

  # Inherit the base package's pathsToLink
  pathsToLink = [
    "/bin"
    "/share/man"
    "/share/bash-completion"
    "/share/zsh"
    "/share/fish"
    "/share/git-core"
    "/libexec"
  ];

  # Module-specific metadata (developer-focused)
  meta = {
    description = "Git development module with utility functions";
    category = "development-module";

    # Reference to auditable base
    audit_reference = {
      base_file = "./package.nix";
      software_inventory = baseGit.meta.software_inventory;
      compliance_info = baseGit.meta.compliance;
    };

    inherit (baseGit.meta) software_inventory compliance tracking;
  };

  passthru = {
    functions = gitFunctions;
    help = gitHelp;
    base = baseGit;

    # Make base package metadata easily accessible
    inherit (baseGit.meta) software_inventory compliance;
  };
}
