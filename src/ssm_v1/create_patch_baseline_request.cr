private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class CreatePatchBaselineRequest
    include JSON::Serializable

    # Defines the operating system the patch baseline applies to. The default value is `WINDOWS`.
    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem | Nil

    # The name of the patch baseline.
    @[JSON::Field(key: "Name")]
    property name : String

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

    # Defines the compliance level for approved patches. When an approved patch is reported as
    # missing, this value describes the severity of the compliance violation. The default value is
    # `UNSPECIFIED`.
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

    # Indicates the status you want to assign to security patches that are available but not approved
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

    # User-provided idempotency token.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    # Optional metadata that you assign to a resource. Tags enable you to categorize a resource in
    # different ways, such as by purpose, owner, or environment. For example, you might want to tag a
    # patch baseline to identify the severity level of patches it specifies and the operating system
    # family it applies to. In this case, you could specify the following key-value pairs:
    #
    # - `Key=PatchSeverity,Value=Critical`
    #
    # - `Key=OS,Value=Windows`
    #
    # To add tags to an existing patch baseline, use the AddTagsToResource operation.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @name : String,
      @operating_system : OperatingSystem | Nil = nil,
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
      @client_token : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("Name length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @global_filters
        value.validate!
      end

      if value = @approval_rules
        value.validate!
      end

      if value = @approved_patches
        raise Core::ValidationError.new("ApprovedPatches must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("ApprovedPatches must have at most 50 item(s)") if value.size > 50
      end

      if value = @rejected_patches
        raise Core::ValidationError.new("RejectedPatches must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("RejectedPatches must have at most 50 item(s)") if value.size > 50
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
      end

      if value = @sources
        raise Core::ValidationError.new("Sources must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Sources must have at most 20 item(s)") if value.size > 20
        value.each(&.validate!)
      end

      if value = @client_token
        raise Core::ValidationError.new("ClientToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientToken length must be <= 64") if value.size > 64
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 1000 item(s)") if value.size > 1000
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@operating_system, @name, @global_filters, @approval_rules, @approved_patches, @approved_patches_compliance_level, @approved_patches_enable_non_security, @rejected_patches, @rejected_patches_action, @description, @sources, @available_security_updates_compliance_status, @client_token, @tags)
  end
end
