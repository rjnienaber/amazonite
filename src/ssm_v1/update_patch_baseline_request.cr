private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class UpdatePatchBaselineRequest
    include JSON::Serializable

    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "GlobalFilters")]
    property global_filters : PatchFilterGroup | Nil

    @[JSON::Field(key: "ApprovalRules")]
    property approval_rules : PatchRuleGroup | Nil

    @[JSON::Field(key: "ApprovedPatches")]
    property approved_patches : Array(String) | Nil

    @[JSON::Field(key: "ApprovedPatchesComplianceLevel", converter: AS::PatchComplianceLevel)]
    property approved_patches_compliance_level : PatchComplianceLevel | Nil

    @[JSON::Field(key: "ApprovedPatchesEnableNonSecurity")]
    property approved_patches_enable_non_security : Bool | Nil

    @[JSON::Field(key: "RejectedPatches")]
    property rejected_patches : Array(String) | Nil

    @[JSON::Field(key: "RejectedPatchesAction", converter: AS::PatchAction)]
    property rejected_patches_action : PatchAction | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "Sources")]
    property sources : Array(PatchSource) | Nil

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
      @replace : Bool | Nil = nil
    )
    end
  end
end
