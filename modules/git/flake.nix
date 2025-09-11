# Git development module with utility functions
{ pkgs }:

let
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
{
  package = pkgs.symlinkJoin {
    name = "git-with-utilities";
    paths = [ pkgs.git ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      # Create utility scripts
      cat > $out/bin/git-help << 'EOF'
${gitHelp}
EOF
      chmod +x $out/bin/git-help
      
      # Export functions for shell integration
      mkdir -p $out/share/git-utilities
      cat > $out/share/git-utilities/functions.sh << 'EOF'
${gitFunctions}
EOF
    '';
  };
  
  meta = {
    name = "git";
    description = "Git version control system with utility functions";
    category = "version-control";
    license = "GPL-2.0";
    upstream = "https://git-scm.com/";
    security_contact = "security@git-scm.com";
    cve_monitoring = true;
    maintainer = "devops-team";
    maintainer_email = "devops@company.com";

    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "low";
    };

    tracking = {
      business_justification = "Essential for version control in software development";
      data_classification = "public";
      network_access = "outbound-only";
    };

  };
  
  # Preserve utility functions for shell integration
  functions = gitFunctions;
  help = gitHelp;
}
