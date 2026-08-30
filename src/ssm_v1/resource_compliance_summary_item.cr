private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @compliance_type
        raise Core::ValidationError.new("ComplianceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ComplianceType length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("ComplianceType does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9_\\-]\\w+|Custom:[a-zA-Z0-9_\\-]\\w+$"))
      end

      if value = @resource_type
        raise Core::ValidationError.new("ResourceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceType length must be <= 50") if value.size > 50
      end

      if value = @resource_id
        raise Core::ValidationError.new("ResourceId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceId length must be <= 100") if value.size > 100
      end

      if value = @execution_summary
        value.validate!
      end

      if value = @compliant_summary
        value.validate!
      end

      if value = @non_compliant_summary
        value.validate!
      end
    end

    def_equals_and_hash(@compliance_type, @resource_type, @resource_id, @status, @overall_severity, @execution_summary, @compliant_summary, @non_compliant_summary)
  end
end
