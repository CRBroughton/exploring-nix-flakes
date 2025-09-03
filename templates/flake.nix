# Enhanced module with developer utility functions
# This file adds productivity features to the base package
# Import the base package and add functions, aliases, and helpers
{ pkgs }:

let
  # CHANGE: Import your base package (update path if needed)
  basePackage = import ./package.nix { inherit pkgs; };
  
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
# Create the enhanced module by combining base package with functions
pkgs.buildEnv {
  name = "CHANGEME-development-module"; # CHANGE: your-tool-development-module
  paths = [ basePackage.packages ];
  
  # Inherit the same pathsToLink from base package
  pathsToLink = [ 
    "/bin" "/share/man" # Add same paths as in package.nix
    # Copy the pathsToLink from your package.nix
  ];
  
  # Enhanced module metadata
  meta = {
    category = "development-module";
    
    # Reference to the auditable base package
    audit_reference = {
      base_file = "./package.nix";
      software_inventory = basePackage.meta;
      compliance_info = basePackage.meta.compliance;
    };
    
    # CHANGE: List the developer features you're adding
    developer_features = [
      "CHANGEME-shortcuts"    # What kinds of shortcuts do you provide?
      "CHANGEME-helpers"      # What helper functions?
      "CHANGEME-integration"  # What integrations?
      # Examples: "git-shortcuts", "project-init", "status-helpers", 
      #          "cleanup-tools", "configuration-management"
    ];
    
    # Inherit all the important metadata from base package
    inherit (basePackage.meta) name description compliance tracking;
  };
  
  # Expose functions and data for use in project flakes
  passthru = {
    # The actual function definitions to inject into shellHook
    functions = utilityFunctions;
    
    # Help text to display
    help = helpText;
    
    # Reference to base package
    base = basePackage;
    
    # Make compliance info easily accessible
    inherit (basePackage.meta) compliance;
  };
}

# === GUIDELINES FOR WRITING GOOD UTILITY FUNCTIONS ===
#
# DO:
#   - Provide shortcuts for common tasks
#   - Add helpful status/info commands  
#   - Include project initialization if applicable
#   - Add cleanup/maintenance functions
#   - Use descriptive function names
#   - Include helpful error messages
#   - Support common command line arguments with "$@"
#
# DON'T:
#   - Install additional software (that goes in package.nix)
#   - Make assumptions about project structure
#   - Use hardcoded paths
#   - Conflict with existing commands
#   - Make functions too complex (keep them simple)
#
# NAMING CONVENTIONS:
#   - tool-action: git-status, node-info, docker-clean
#   - init-tool: init-node, init-python, init-rust
#   - clean-tool: clean-node, clean-docker, clean-cache
#
# COMMON FUNCTION PATTERNS:
#   - {tool}-info: Show version, config, environment info
#   - init-{tool}: Initialize new project with this tool
#   - {tool}-status: Show current status/state
#   - clean-{tool}: Clean up artifacts, caches, temporary files
#   - {tool}-update: Update dependencies, packages, etc.
#   - {tool}-list: List available items, packages, etc.