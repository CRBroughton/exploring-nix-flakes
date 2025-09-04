{ pkgs }:

pkgs.buildEnv {
  name = "elixir-development-module"; # CHANGE: your-tool-development-module
  paths = with pkgs; [
    beamMinimal27Packages.elixir
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
    name = "elixir"; # Package name (lowercase, no spaces)
    description = "elixir development module with utility functions"; # One-line description
    category = "development-module";
    license = "CHANGEME-LICENSE"; # License: MIT, GPL-2.0, Apache-2.0, BSD-3-Clause, etc.
    upstream = "CHANGEME-URL"; # Official project website
    security_contact = "CHANGEME-CONTACT"; # Where to report security issues
    cve_monitoring = false; # true/false - does this tool have CVE monitoring?
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
      approved = false; # true/false - has this been approved for use?
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
