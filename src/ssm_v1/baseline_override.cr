private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # Defines the basic information about a patch baseline override.
  class BaselineOverride
    include JSON::Serializable

    # The operating system rule used by the patch baseline override.
    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem | Nil

    @[JSON::Field(key: "GlobalFilters")]
    property global_filters : PatchFilterGroup | Nil

    @[JSON::Field(key: "ApprovalRules")]
    property approval_rules : PatchRuleGroup | Nil

    # A list of explicitly approved patches for the baseline.
    #
    # For information about accepted formats for lists of approved patches and rejected patches, see
    # [Package name formats for approved and rejected patch
    # lists](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "ApprovedPatches")]
    property approved_patches : Array(String) | Nil

    # Defines the compliance level for approved patches. When an approved patch is reported as
    # missing, this value describes the severity of the compliance violation.
    @[JSON::Field(key: "ApprovedPatchesComplianceLevel", converter: AS::PatchComplianceLevel)]
    property approved_patches_compliance_level : PatchComplianceLevel | Nil

    # A list of explicitly rejected patches for the baseline.
    #
    # For information about accepted formats for lists of approved patches and rejected patches, see
    # [Package name formats for approved and rejected patch
    # lists](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "RejectedPatches")]
    property rejected_patches : Array(String) | Nil

    # The action for Patch Manager to take on patches included in the `RejectedPackages` list. A patch
    # can be allowed only if it is a dependency of another package, or blocked entirely along with
    # packages that include it as a dependency.
    @[JSON::Field(key: "RejectedPatchesAction", converter: AS::PatchAction)]
    property rejected_patches_action : PatchAction | Nil

    # Indicates whether the list of approved patches includes non-security updates that should be
    # applied to the managed nodes. The default value is `false`. Applies to Linux managed nodes only.
    @[JSON::Field(key: "ApprovedPatchesEnableNonSecurity")]
    property approved_patches_enable_non_security : Bool | Nil

    # Information about the patches to use to update the managed nodes, including target operating
    # systems and source repositories. Applies to Linux managed nodes only.
    @[JSON::Field(key: "Sources")]
    property sources : Array(PatchSource) | Nil

    # Indicates whether managed nodes for which there are available security-related patches that have
    # not been approved by the baseline are being defined as `COMPLIANT` or `NON_COMPLIANT`. This
    # option is specified when the `CreatePatchBaseline` or `UpdatePatchBaseline` commands are run.
    #
    # Applies to Windows Server managed nodes only.
    @[JSON::Field(key: "AvailableSecurityUpdatesComplianceStatus", converter: AS::PatchComplianceStatus)]
    property available_security_updates_compliance_status : PatchComplianceStatus | Nil

    def initialize(
      @operating_system : OperatingSystem | Nil = nil,
      @global_filters : PatchFilterGroup | Nil = nil,
      @approval_rules : PatchRuleGroup | Nil = nil,
      @approved_patches : Array(String) | Nil = nil,
      @approved_patches_compliance_level : PatchComplianceLevel | Nil = nil,
      @rejected_patches : Array(String) | Nil = nil,
      @rejected_patches_action : PatchAction | Nil = nil,
      @approved_patches_enable_non_security : Bool | Nil = nil,
      @sources : Array(PatchSource) | Nil = nil,
      @available_security_updates_compliance_status : PatchComplianceStatus | Nil = nil,
    )
    end

    def_equals_and_hash(@operating_system, @global_filters, @approval_rules, @approved_patches, @approved_patches_compliance_level, @rejected_patches, @rejected_patches_action, @approved_patches_enable_non_security, @sources, @available_security_updates_compliance_status)
  end
end
