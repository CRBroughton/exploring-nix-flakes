{ pkgs }:

pkgs.buildEnv {
  name = "go-development-module";
  paths = with pkgs; [
    go
  ];
  pathsToLink = [
    "/bin"   # Go executables (go, gofmt)
    "/share" # Go runtime, standard library, and GOROOT
  ];

  meta = {
    # Basic identification
    name = "go";
    description = "Go development module with compiler and runtime";
    category = "development-module";
    license = "BSD-3-Clause";
    upstream = "https://golang.org/";
    security_contact = "security@golang.org";
    cve_monitoring = true;
    maintainer = "platform-team";
    maintainer_email = "platform@company.com";

    # Developer features
    developer_features = [
      "go-compiler"
      "go-modules"
      "go-runtime"
      "code-formatting"
      "build-tools"
    ];

    # Compliance information
    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "platform-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "low";
      notes = "Standard Go compiler and runtime, well-established tool";
    };

    # Usage tracking and business justification
    tracking = {
      business_justification = "Go programming language support for backend services and tooling";
      data_classification = "public";
      network_access = "outbound-required";
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
