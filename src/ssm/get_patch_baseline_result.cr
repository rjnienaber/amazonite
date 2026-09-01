private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetPatchBaselineResult
    include JSON::Serializable

    # The ID of the retrieved patch baseline.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String | Nil

    # The name of the patch baseline.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # Returns the operating system specified for the patch baseline.
    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem | Nil

    # A set of global filters used to exclude patches from the baseline.
    @[JSON::Field(key: "GlobalFilters")]
    property global_filters : PatchFilterGroup | Nil

    # A set of rules used to include patches in the baseline.
    @[JSON::Field(key: "ApprovalRules")]
    property approval_rules : PatchRuleGroup | Nil

    # A list of explicitly approved patches for the baseline.
    @[JSON::Field(key: "ApprovedPatches")]
    property approved_patches : Array(String) | Nil

    # Returns the specified compliance severity level for approved patches in the patch baseline.
    @[JSON::Field(key: "ApprovedPatchesComplianceLevel", converter: AS::PatchComplianceLevel)]
    property approved_patches_compliance_level : PatchComplianceLevel | Nil

    # Indicates whether the list of approved patches includes non-security updates that should be
    # applied to the managed nodes. The default value is `false`. Applies to Linux managed nodes only.
    @[JSON::Field(key: "ApprovedPatchesEnableNonSecurity")]
    property approved_patches_enable_non_security : Bool | Nil

    # A list of explicitly rejected patches for the baseline.
    @[JSON::Field(key: "RejectedPatches")]
    property rejected_patches : Array(String) | Nil

    # The action specified to take on patches included in the `RejectedPatches` list. A patch can be
    # allowed only if it is a dependency of another package, or blocked entirely along with packages
    # that include it as a dependency.
    @[JSON::Field(key: "RejectedPatchesAction", converter: AS::PatchAction)]
    property rejected_patches_action : PatchAction | Nil

    # Patch groups included in the patch baseline.
    @[JSON::Field(key: "PatchGroups")]
    property patch_groups : Array(String) | Nil

    # The date the patch baseline was created.
    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # The date the patch baseline was last modified.
    @[JSON::Field(key: "ModifiedDate", converter: Core::AWSEpochConverter)]
    property modified_date : Time | Nil

    # A description of the patch baseline.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # Information about the patches to use to update the managed nodes, including target operating
    # systems and source repositories. Applies to Linux managed nodes only.
    @[JSON::Field(key: "Sources")]
    property sources : Array(PatchSource) | Nil

    # Indicates the compliance status of managed nodes for which security-related patches are
    # available but were not approved. This preference is specified when the `CreatePatchBaseline` or
    # `UpdatePatchBaseline` commands are run.
    #
    # Applies to Windows Server managed nodes only.
    @[JSON::Field(key: "AvailableSecurityUpdatesComplianceStatus", converter: AS::PatchComplianceStatus)]
    property available_security_updates_compliance_status : PatchComplianceStatus | Nil

    def initialize(
      @baseline_id : String | Nil = nil,
      @name : String | Nil = nil,
      @operating_system : OperatingSystem | Nil = nil,
      @global_filters : PatchFilterGroup | Nil = nil,
      @approval_rules : PatchRuleGroup | Nil = nil,
      @approved_patches : Array(String) | Nil = nil,
      @approved_patches_compliance_level : PatchComplianceLevel | Nil = nil,
      @approved_patches_enable_non_security : Bool | Nil = nil,
      @rejected_patches : Array(String) | Nil = nil,
      @rejected_patches_action : PatchAction | Nil = nil,
      @patch_groups : Array(String) | Nil = nil,
      @created_date : Time | Nil = nil,
      @modified_date : Time | Nil = nil,
      @description : String | Nil = nil,
      @sources : Array(PatchSource) | Nil = nil,
      @available_security_updates_compliance_status : PatchComplianceStatus | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @baseline_id
        raise Core::ValidationError.new("BaselineId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("BaselineId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("BaselineId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-:/]{20,128}$"))
      end

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
    end

    def_equals_and_hash(@baseline_id, @name, @operating_system, @global_filters, @approval_rules, @approved_patches, @approved_patches_compliance_level, @approved_patches_enable_non_security, @rejected_patches, @rejected_patches_action, @patch_groups, @created_date, @modified_date, @description, @sources, @available_security_updates_compliance_status)
  end
end
