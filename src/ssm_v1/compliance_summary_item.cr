module Amazonite::SsmV1
  class ComplianceSummaryItem
    include JSON::Serializable

    @[JSON::Field(key: "ComplianceType")]
    property compliance_type : String | Nil

    @[JSON::Field(key: "CompliantSummary")]
    property compliant_summary : CompliantSummary | Nil

    @[JSON::Field(key: "NonCompliantSummary")]
    property non_compliant_summary : NonCompliantSummary | Nil

    def initialize(
      @compliance_type : String | Nil = nil,
      @compliant_summary : CompliantSummary | Nil = nil,
      @non_compliant_summary : NonCompliantSummary | Nil = nil
    )
    end
  end
end
