private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class PatchRule
    include JSON::Serializable

    @[JSON::Field(key: "PatchFilterGroup")]
    property patch_filter_group : PatchFilterGroup

    @[JSON::Field(key: "ComplianceLevel", converter: AS::PatchComplianceLevel)]
    property compliance_level : PatchComplianceLevel | Nil

    @[JSON::Field(key: "ApproveAfterDays")]
    property approve_after_days : Int32 | Nil

    @[JSON::Field(key: "ApproveUntilDate")]
    property approve_until_date : String | Nil

    @[JSON::Field(key: "EnableNonSecurity")]
    property enable_non_security : Bool | Nil

    def initialize(
      @patch_filter_group : PatchFilterGroup,
      @compliance_level : PatchComplianceLevel | Nil = nil,
      @approve_after_days : Int32 | Nil = nil,
      @approve_until_date : String | Nil = nil,
      @enable_non_security : Bool | Nil = nil
    )
    end
  end
end
