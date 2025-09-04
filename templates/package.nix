## Base Package Template (`templates/package.nix`)

# Pure package definition - IT auditable
# This file defines ONLY the software packages that get installed
# NO utility functions or scripts should go here
{ pkgs }:

{
  # The actual software packages that will be installed
  packages = pkgs.buildEnv {
    name = "CHANGEME-package"; # CHANGE: your-module-name-package
    paths = with pkgs; [
      # CHANGE: List the actual packages from nixpkgs
      # Example: git, nodejs_22, python3, etc.
      # Keep this minimal - one primary tool per module
      CHANGEME-PACKAGE-NAME
    ];
    pathsToLink = [
      # CHANGE: Include paths needed for your tool to work properly
      # Common paths (uncomment what you need):
      "/bin" # Executables (almost always needed)
      # "/share/man"            # Manual pages (recommended)
      # "/share/bash-completion" # Bash tab completion
      # "/share/zsh"            # Zsh completions
      # "/share/fish"           # Fish completions
      # "/lib"                  # Libraries (for runtimes like node, python)
      # "/include"              # Headers (for compiling native modules)
      # "/share/doc"            # Documentation
      # "/etc"                  # Configuration files
    ];
  };

  # IT-required metadata - fill out completely and accurately
  meta = {
    # CHANGE: Basic identification
    name = "CHANGEME-NAME"; # Package name (lowercase, no spaces)
    description = "CHANGEME-DESC"; # One-line description of what this tool does
    category = "CHANGEME-CATEGORY";
    # Categories: version-control, javascript-runtime,
    #           package-manager, shell, developer-tools,
    #           database, container, editor, etc.

    # CHANGE: Legal and security information
    license = "CHANGEME-LICENSE"; # License: MIT, GPL-2.0, Apache-2.0, BSD-3-Clause, etc.
    upstream = "CHANGEME-URL"; # Official project website
    security_contact = "CHANGEME-CONTACT"; # Where to report security issues
    cve_monitoring = CHANGEME-BOOL; # true/false - does this tool have CVE monitoring?

    # CHANGE: Organizational ownership
    maintainer = "CHANGEME-TEAM"; # Which team maintains this module
    maintainer_email = "CHANGEME-EMAIL"; # Team email for questions

    # CHANGE: Compliance information (work with IT/Security team)
    compliance = {
      approved = CHANGEME-BOOL; # true/false - has this been approved for use?
      approval_date = "YYYY-MM-DD"; # When was this approved?
      approved_by = "CHANGEME-WHO"; # Which team/person approved this?
      last_audit = "YYYY-MM-DD"; # When was this last audited?
      next_audit = "YYYY-MM-DD"; # When should this be audited again?
      risk_level = "CHANGEME-RISK"; # low/medium/high risk assessment
      notes = "CHANGEME-NOTES"; # Optional: any special compliance notes
    };

    # CHANGE: Usage tracking and business justification
    tracking = {
      business_justification = "CHANGEME-JUSTIFICATION"; # Why do we need this tool?
      data_classification = "CHANGEME-CLASSIFICATION"; # public/internal/confidential
      network_access = "CHANGEME-NETWORK"; # none/outbound-only/outbound-required/bidirectional
    };
  };
}

# === EXAMPLES FOR COMMON FIELDS ===
#
# CATEGORIES:
#   - "version-control"     # git, mercurial, svn
#   - "javascript-runtime"  # node, deno, bun
#   - "package-manager"     # npm, pnpm, yarn, pip, cargo
#   - "shell"               # bash, zsh, fish
#   - "developer-tools"     # jq, curl, wget, httpie
#   - "editor"              # vim, emacs, vscode
#   - "database"            # postgresql, mysql, redis
#   - "container"           # docker, podman, kubernetes
#
# LICENSES:
#   - "MIT"                 # Most permissive
#   - "Apache-2.0"          # Apache projects
#   - "GPL-2.0" / "GPL-3.0" # Copyleft licenses
#   - "BSD-3-Clause"        # BSD license
#   - "ISC"                 # ISC license
#
# RISK LEVELS:
#   - "low"     # Simple tools, no network access, well-established
#   - "medium"  # Network access required, newer tools, package managers
#   - "high"    # Experimental tools, significant security implications
#
# NETWORK ACCESS:
#   - "none"                # Tool doesn't access network
#   - "outbound-only"       # Can make outbound requests only
#   - "outbound-required"   # Requires internet to function (package managers)
#   - "bidirectional"       # Can accept incoming connections
