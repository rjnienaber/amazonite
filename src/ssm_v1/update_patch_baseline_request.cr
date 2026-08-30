private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class UpdatePatchBaselineRequest
    include JSON::Serializable

    # The ID of the patch baseline to update.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String

    # The name of the patch baseline.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # A set of global filters used to include patches in the baseline.
    #
    # The `GlobalFilters` parameter can be configured only by using the CLI or an Amazon Web Services
    # SDK. It can't be configured from the Patch Manager console, and its value isn't displayed in the
    # console.
    @[JSON::Field(key: "GlobalFilters")]
    property global_filters : PatchFilterGroup | Nil

    # A set of rules used to include patches in the baseline.
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

    # Assigns a new compliance severity level to an existing patch baseline.
    @[JSON::Field(key: "ApprovedPatchesComplianceLevel", converter: AS::PatchComplianceLevel)]
    property approved_patches_compliance_level : PatchComplianceLevel | Nil

    # Indicates whether the list of approved patches includes non-security updates that should be
    # applied to the managed nodes. The default value is `false`. Applies to Linux managed nodes only.
    @[JSON::Field(key: "ApprovedPatchesEnableNonSecurity")]
    property approved_patches_enable_non_security : Bool | Nil

    # A list of explicitly rejected patches for the baseline.
    #
    # For information about accepted formats for lists of approved patches and rejected patches, see
    # [Package name formats for approved and rejected patch
    # lists](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "RejectedPatches")]
    property rejected_patches : Array(String) | Nil

    # The action for Patch Manager to take on patches included in the `RejectedPackages` list.
    #
    # ALLOW_AS_DEPENDENCY **Linux and macOS**: A package in the rejected patches list is installed
    # only if it is a dependency of another package. It is considered compliant with the patch
    # baseline, and its status is reported as `INSTALLED_OTHER`. This is the default action if no
    # option is specified.
    #
    # **Windows Server**: Windows Server doesn't support the concept of package dependencies. If a
    # package in the rejected patches list and already installed on the node, its status is reported
    # as `INSTALLED_OTHER`. Any package not already installed on the node is skipped. This is the
    # default action if no option is specified.
    #
    # BLOCK **All OSs**: Packages in the rejected patches list, and packages that include them as
    # dependencies, aren't installed by Patch Manager under any circumstances.
    #
    # State value assignment for patch compliance:
    #
    # - If a package was installed before it was added to the rejected patches list, or is installed
    # outside of Patch Manager afterward, it's considered noncompliant with the patch baseline and its
    # status is reported as `INSTALLED_REJECTED`.
    #
    # - If an update attempts to install a dependency package that is now rejected by the baseline,
    # when previous versions of the package were not rejected, the package being updated is reported
    # as `MISSING` for `SCAN` operations and as `FAILED` for `INSTALL` operations.
    @[JSON::Field(key: "RejectedPatchesAction", converter: AS::PatchAction)]
    property rejected_patches_action : PatchAction | Nil

    # A description of the patch baseline.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # Information about the patches to use to update the managed nodes, including target operating
    # systems and source repositories. Applies to Linux managed nodes only.
    @[JSON::Field(key: "Sources")]
    property sources : Array(PatchSource) | Nil

    # Indicates the status to be assigned to security patches that are available but not approved
    # because they don't meet the installation criteria specified in the patch baseline.
    #
    # Example scenario: Security patches that you might want installed can be skipped if you have
    # specified a long period to wait after a patch is released before installation. If an update to
    # the patch is released during your specified waiting period, the waiting period for installing
    # the patch starts over. If the waiting period is too long, multiple versions of the patch could
    # be released but never installed.
    #
    # Supported for Windows Server managed nodes only.
    @[JSON::Field(key: "AvailableSecurityUpdatesComplianceStatus", converter: AS::PatchComplianceStatus)]
    property available_security_updates_compliance_status : PatchComplianceStatus | Nil

    # If True, then all fields that are required by the CreatePatchBaseline operation are also
    # required for this API request. Optional fields that aren't specified are set to null.
    @[JSON::Field(key: "Replace")]
    property replace : Bool | Nil

    def initialize(
      @baseline_id : String,
      @name : String | Nil = nil,
      @global_filters : PatchFilterGroup | Nil = nil,
      @approval_rules : PatchRuleGroup | Nil = nil,
      @approved_patches : Array(String) | Nil = nil,
      @approved_patches_compliance_level : PatchComplianceLevel | Nil = nil,
      @approved_patches_enable_non_security : Bool | Nil = nil,
      @rejected_patches : Array(String) | Nil = nil,
      @rejected_patches_action : PatchAction | Nil = nil,
      @description : String | Nil = nil,
      @sources : Array(PatchSource) | Nil = nil,
      @available_security_updates_compliance_status : PatchComplianceStatus | Nil = nil,
      @replace : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@baseline_id, @name, @global_filters, @approval_rules, @approved_patches, @approved_patches_compliance_level, @approved_patches_enable_non_security, @rejected_patches, @rejected_patches_action, @description, @sources, @available_security_updates_compliance_status, @replace)
  end
end
