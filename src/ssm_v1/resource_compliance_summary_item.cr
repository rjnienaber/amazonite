private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class ResourceComplianceSummaryItem
    include JSON::Serializable

    @[JSON::Field(key: "ComplianceType")]
    property compliance_type : String | Nil

    @[JSON::Field(key: "ResourceType")]
    property resource_type : String | Nil

    @[JSON::Field(key: "ResourceId")]
    property resource_id : String | Nil

    @[JSON::Field(key: "Status", converter: AS::ComplianceStatus)]
    property status : ComplianceStatus | Nil

    @[JSON::Field(key: "OverallSeverity", converter: AS::ComplianceSeverity)]
    property overall_severity : ComplianceSeverity | Nil

    @[JSON::Field(key: "ExecutionSummary")]
    property execution_summary : ComplianceExecutionSummary | Nil

    @[JSON::Field(key: "CompliantSummary")]
    property compliant_summary : CompliantSummary | Nil

    @[JSON::Field(key: "NonCompliantSummary")]
    property non_compliant_summary : NonCompliantSummary | Nil

    def initialize(
      @compliance_type : String | Nil = nil,
      @resource_type : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @status : ComplianceStatus | Nil = nil,
      @overall_severity : ComplianceSeverity | Nil = nil,
      @execution_summary : ComplianceExecutionSummary | Nil = nil,
      @compliant_summary : CompliantSummary | Nil = nil,
      @non_compliant_summary : NonCompliantSummary | Nil = nil
    )
    end
  end
end
