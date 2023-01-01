private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class CreatePatchBaselineRequest
    include JSON::Serializable

    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem | Nil

    @[JSON::Field(key: "Name")]
    property name : String

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

    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

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
      @client_token : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil
    )
    end
  end
end
