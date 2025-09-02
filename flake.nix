{
  description = "Development tools collection";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # Import all modules
        gitModule = import ./modules/git/flake.nix;
        lazygitModule = import ./modules/lazygit/flake.nix;

        # Import base packages
        gitPackage = import ./modules/git/package.nix;
        lazygitPackage = import ./modules/lazygit/package.nix;

        # Get current date
        currentDate = builtins.readFile (
          pkgs.runCommand "current-date" { } ''
            date "+%Y-%m-%d %H:%M:%S UTC" > $out
          ''
        );

        # All modules for table generation
        allModules = [
          (gitPackage { inherit pkgs; })
          (lazygitPackage { inherit pkgs; })
        ];

        # Generate markdown table for software inventory
        generateSoftwareTable =
          modules:
          let
            tableHeader = ''
              | Name | Description | Category | License | CVE Monitoring | Risk Level |
              |------|-------------|----------|---------|----------------|------------|'';

            tableRow =
              mod:
              ''| ${mod.meta.name} | ${mod.meta.description} | ${mod.meta.category} | ${mod.meta.license} | ${
                if mod.meta.cve_monitoring then "✅" else "❌"
              } | ${mod.meta.compliance.risk_level} |'';

            tableRows = pkgs.lib.concatMapStringsSep "\n" tableRow modules;
          in
          tableHeader + "\n" + tableRows;

        # Generate compliance table
        generateComplianceTable =
          modules:
          let
            tableHeader = ''
              | Name | Approved | Approved By | Last Audit | Next Audit | Maintainer |
              |------|----------|-------------|------------|------------|------------|'';

            tableRow =
              mod:
              ''| ${mod.meta.name} | ${
                if mod.meta.compliance.approved then "✅" else "❌"
              } | ${mod.meta.compliance.approved_by} | ${mod.meta.compliance.last_audit} | ${mod.meta.compliance.next_audit} | ${mod.meta.maintainer} |'';

            tableRows = pkgs.lib.concatMapStringsSep "\n" tableRow modules;
          in
          tableHeader + "\n" + tableRows;

      in
      {
        # Export enhanced modules
        modules = {
          git = gitModule { inherit pkgs; };
          lazygit = lazygitModule { inherit pkgs; };
        };

        # Export base packages
        packages = {
          git-base = (gitPackage { inherit pkgs; }).packages;
          lazygit-base = (lazygitPackage { inherit pkgs; }).packages;

          # JSON reports
          generateInventory = pkgs.writeText "software-inventory.json" (
            builtins.toJSON (map (mod: mod.meta) allModules)
          );

          # Markdown table report
          generateInventoryMd = pkgs.writeText "software-inventory.md" ''
            # Software Inventory Report

            Generated on: ${builtins.replaceStrings [ "\n" ] [ "" ] currentDate}

            ## Software Inventory

            ${generateSoftwareTable allModules}

            ## Compliance Status

            ${generateComplianceTable allModules}

            ## Summary

            - **Total Modules**: ${toString (builtins.length allModules)}
            - **Approved Modules**: ${
              toString (builtins.length (builtins.filter (mod: mod.meta.compliance.approved) allModules))
            }
            - **CVE Monitored**: ${
              toString (builtins.length (builtins.filter (mod: mod.meta.cve_monitoring) allModules))
            }
            - **High Risk**: ${
              toString (
                builtins.length (builtins.filter (mod: mod.meta.compliance.risk_level == "high") allModules)
              )
            }

            ## Module Details

            ${pkgs.lib.concatMapStrings (mod: ''
              ### ${mod.meta.name}

              - **Business Justification**: ${mod.meta.tracking.business_justification}
              - **Data Classification**: ${mod.meta.tracking.data_classification}
              - **Network Access**: ${mod.meta.tracking.network_access}
              - **Upstream**: ${mod.meta.upstream}
              - **Security Contact**: ${mod.meta.security_contact}

            '') allModules}
          '';
        };

        # Export compliance metadata
        compliance = {
          git = (gitPackage { inherit pkgs; }).meta;
          lazygit = (lazygitPackage { inherit pkgs; }).meta;
        };
      }
    );
}
