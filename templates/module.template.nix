# Unified Module Template
# This template creates a single unified flake that combines package definition
# and development features in one file
{ pkgs }:

let
  # CHANGE: Define utility functions that help developers use this tool
  # These are bash functions that get injected into the shell environment
  utilityFunctions = ''
    # CHANGE: Add your utility functions here
    # These should be common tasks developers do with your tool

    # Example: Tool information
    CHANGEME-info() {
      echo "CHANGEME Tool Information:"
      echo "  Version: $(CHANGEME-COMMAND --version)"
      echo "  Location: $(which CHANGEME-COMMAND)"
      # Add more useful info about the tool
    }

    # Example: Project initialization (if applicable)
    init-CHANGEME() {
      if [ ! -f CHANGEME-CONFIG-FILE ]; then
        echo "Initializing CHANGEME project..."
        CHANGEME-COMMAND init
        echo "Project initialized!"
      else
        echo "CHANGEME project already initialized"
      fi
    }

    # Example: Common shortcuts (adapt to your tool)
    CHANGEME-status() {
      CHANGEME-COMMAND status "$@"
    }

    CHANGEME-list() {
      CHANGEME-COMMAND list "$@"  
    }

    # Example: Cleanup function (if applicable)
    clean-CHANGEME() {
      echo "Cleaning CHANGEME artifacts..."
      rm -rf CHANGEME-CACHE-DIR CHANGEME-TEMP-FILES
      echo "Cleanup complete!"
    }

    # CHANGE: Add more functions specific to your tool
    # Think about: What do developers do most often with this tool?
    # Common patterns: init, status, list, clean, update, configure
  '';

  # CHANGE: Define help text that explains all your functions
  helpText = ''
    echo "CHANGEME utilities:"
    echo "  CHANGEME-info       - Show tool information"
    echo "  init-CHANGEME       - Initialize new project"
    echo "  CHANGEME-status     - Check status"
    echo "  CHANGEME-list       - List items"
    echo "  clean-CHANGEME      - Clean up artifacts"
    echo ""
    echo "Common usage:"
    echo "  CHANGEME-COMMAND --help    # Get tool help"
    echo "  init-CHANGEME              # Set up project"
    echo "  CHANGEME-status            # Check current state"
    echo ""
    echo "For more info: CHANGEME-info"
  '';

in
# Unified package and development module
pkgs.buildEnv {
  name = "CHANGEME-development-module"; # CHANGE: your-tool-development-module
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

  meta = {
    # CHANGE: Basic identification
    name = "CHANGEME-NAME"; # Package name (lowercase, no spaces)
    description = "CHANGEME-DESC development module with utility functions"; # One-line description
    category = "development-module";
    license = "CHANGEME-LICENSE"; # License: MIT, GPL-2.0, Apache-2.0, BSD-3-Clause, etc.
    upstream = "CHANGEME-URL"; # Official project website
    security_contact = "CHANGEME-CONTACT"; # Where to report security issues
    cve_monitoring = CHANGEME-BOOL; # true/false - does this tool have CVE monitoring?
    maintainer = "CHANGEME-TEAM"; # Which team maintains this module
    maintainer_email = "CHANGEME-EMAIL"; # Team email for questions

    # CHANGE: List the developer features you're adding
    developer_features = [
      "CHANGEME-shortcuts" # What kinds of shortcuts do you provide?
      "CHANGEME-helpers" # What helper functions?
      "CHANGEME-integration" # What integrations?
      # Examples: "git-shortcuts", "project-init", "status-helpers",
      #          "cleanup-tools", "configuration-management"
    ];

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

    # Audit reference - unified flake
    audit_reference = {
      base_file = "unified-flake";
      compliance_info = "inline";
    };
  };

  passthru = {
    # The actual function definitions to inject into shellHook
    functions = utilityFunctions;

    # Help text to display
    help = helpText;
  };
}

# === GUIDELINES FOR WRITING GOOD UNIFIED MODULES ===
#
# PACKAGE SELECTION:
#   - Choose ONE primary tool per module (git, node, php, etc.)
#   - Use the most current stable version unless there's a business need for older versions
#   - Include essential paths in pathsToLink for the tool to work properly
#
# UTILITY FUNCTIONS:
#   DO:
#     - Provide shortcuts for common tasks
#     - Add helpful status/info commands
#     - Include project initialization if applicable
#     - Add cleanup/maintenance functions
#     - Use descriptive function names
#     - Include helpful error messages
#     - Support command line arguments with "$@"
#
#   DON'T:
#     - Install additional software (add to paths instead)
#     - Make assumptions about project structure
#     - Use hardcoded paths
#     - Conflict with existing commands
#     - Make functions too complex (keep them simple)
#
# NAMING CONVENTIONS:
#   - tool-action: git-status, node-info, docker-clean
#   - init-tool: init-node, init-python, init-rust
#   - clean-tool: clean-node, clean-docker, clean-cache
#
# METADATA:
#   - Fill out ALL fields completely and accurately
#   - Work with IT/Security team for compliance information
#   - Use appropriate risk levels and network access descriptions
#   - Include meaningful developer_features list
#
# COMMON CATEGORIES:
#   - "version-control", "javascript-runtime", "package-manager"
#   - "shell", "developer-tools", "editor", "database", "container"
#
# RISK LEVELS:
#   - "low": Simple tools, no network access, well-established
#   - "medium": Network access required, newer tools, package managers
#   - "high": Experimental tools, significant security implications
