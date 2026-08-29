private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # Compliance summary information for a specific resource.
  class ResourceComplianceSummaryItem
    include JSON::Serializable

    # The compliance type.
    @[JSON::Field(key: "ComplianceType")]
    property compliance_type : String | Nil

    # The resource type.
    @[JSON::Field(key: "ResourceType")]
    property resource_type : String | Nil

    # The resource ID.
    @[JSON::Field(key: "ResourceId")]
    property resource_id : String | Nil

    # The compliance status for the resource.
    @[JSON::Field(key: "Status", converter: AS::ComplianceStatus)]
    property status : ComplianceStatus | Nil

    # The highest severity item found for the resource. The resource is compliant for this item.
    @[JSON::Field(key: "OverallSeverity", converter: AS::ComplianceSeverity)]
    property overall_severity : ComplianceSeverity | Nil

    # Information about the execution.
    @[JSON::Field(key: "ExecutionSummary")]
    property execution_summary : ComplianceExecutionSummary | Nil

    # A list of items that are compliant for the resource.
    @[JSON::Field(key: "CompliantSummary")]
    property compliant_summary : CompliantSummary | Nil

    # A list of items that aren't compliant for the resource.
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
      @non_compliant_summary : NonCompliantSummary | Nil = nil,
    )
    end
  end
end
