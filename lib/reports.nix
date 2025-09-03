{
  pkgs,
  lib ? pkgs.lib,
}:

let
  # Get current date
  getCurrentDate = builtins.readFile (
    pkgs.runCommand "current-date" { } ''
      date "+%Y-%m-%d %H:%M:%S UTC" > $out
    ''
  );

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

      tableRows = lib.concatMapStringsSep "\n" tableRow modules;
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

      tableRows = lib.concatMapStringsSep "\n" tableRow modules;
    in
    tableHeader + "\n" + tableRows;

  # Generate full markdown report
  generateMarkdownReport =
    modules:
    let
      currentDate = getCurrentDate;
      approvedModules = builtins.filter (mod: mod.meta.compliance.approved) modules;
      cveMonitoredModules = builtins.filter (mod: mod.meta.cve_monitoring) modules;
      highRiskModules = builtins.filter (mod: mod.meta.compliance.risk_level == "high") modules;
    in
    pkgs.writeText "software-inventory.md" ''
      # Software Inventory Report

      Generated on: ${builtins.replaceStrings [ "\n" ] [ "" ] currentDate}

      ## Software Inventory

      ${generateSoftwareTable modules}

      ## Compliance Status

      ${generateComplianceTable modules}

      ## Summary

      - **Total Modules**: ${toString (builtins.length modules)}
      - **Approved Modules**: ${toString (builtins.length approvedModules)}
      - **CVE Monitored**: ${toString (builtins.length cveMonitoredModules)}
      - **High Risk**: ${toString (builtins.length highRiskModules)}

      ## Module Details

      ${lib.concatMapStringsSep "\n" (mod: ''
        ### ${mod.meta.name}

        - **Business Justification**: ${mod.meta.tracking.business_justification}
        - **Data Classification**: ${mod.meta.tracking.data_classification}
        - **Network Access**: ${mod.meta.tracking.network_access}
        - **Upstream**: ${mod.meta.upstream}
        - **Security Contact**: ${mod.meta.security_contact}
      '') modules}
    '';

  # Generate JSON report
  generateJsonReport =
    modules: pkgs.writeText "software-inventory.json" (builtins.toJSON (map (mod: mod.meta) modules));

in
{
  inherit generateMarkdownReport generateJsonReport;
  inherit generateSoftwareTable generateComplianceTable;
}
