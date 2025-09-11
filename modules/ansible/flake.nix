{ pkgs }:

{
  package = pkgs.ansible;
  
  meta = {
    name = "ansible";
    description = "IT automation platform for configuration management and deployment";
    category = "automation-tools";
    license = "GPL-3.0";
    upstream = "https://www.ansible.com";
    security_contact = "security@ansible.com";
    cve_monitoring = true;
    maintainer = "devops-team";
    maintainer_email = "devops@company.com";

    developer_features = [
      "configuration-management"
      "deployment-automation"
      "infrastructure-as-code"
    ];

    compliance = {
      approved = true;
      approval_date = "2024-01-15";
      approved_by = "security-team";
      last_audit = "2024-01-15";
      next_audit = "2024-07-15";
      risk_level = "medium";
      notes = "Network access required for remote system management";
    };

    tracking = {
      business_justification = "Infrastructure automation and configuration management";
      data_classification = "internal";
      network_access = "bidirectional";
    };

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
