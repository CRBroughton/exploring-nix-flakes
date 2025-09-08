# Unified Module Template
# This template creates a single unified flake that combines package definition
# and development features in one file
{ pkgs }:

# Unified package and development module
pkgs.buildEnv {
  name = "ni-development-module"; # CHANGE: your-tool-development-module
  paths = with pkgs; [
    ni
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
    name = "ni"; # Package name (lowercase, no spaces)
    description = "CHANGEME-DESC development module with utility functions"; # One-line description
    category = "development-module";
    license = "CHANGEME-LICENSE"; # License: MIT, GPL-2.0, Apache-2.0, BSD-3-Clause, etc.
    upstream = "CHANGEME-URL"; # Official project website
    security_contact = "CHANGEME-CONTACT"; # Where to report security issues
    cve_monitoring = true; # true/false - does this tool have CVE monitoring?
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
      approved = true; # true/false - has this been approved for use?
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
