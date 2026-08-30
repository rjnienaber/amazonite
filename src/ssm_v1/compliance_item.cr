private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Information about the compliance as defined by the resource type. For example, for a patch
  # resource type, `Items` includes information about the PatchSeverity, Classification, and so on.
  class ComplianceItem
    include JSON::Serializable

    # The compliance type. For example, Association (for a State Manager association), Patch, or
    # Custom:`string` are all valid compliance types.
    @[JSON::Field(key: "ComplianceType")]
    property compliance_type : String | Nil

    # The type of resource. `ManagedInstance` is currently the only supported resource type.
    @[JSON::Field(key: "ResourceType")]
    property resource_type : String | Nil

    # An ID for the resource. For a managed node, this is the node ID.
    @[JSON::Field(key: "ResourceId")]
    property resource_id : String | Nil

    # An ID for the compliance item. For example, if the compliance item is a Windows patch, the ID
    # could be the number of the KB article; for example: KB4010320.
    @[JSON::Field(key: "Id")]
    property id : String | Nil

    # A title for the compliance item. For example, if the compliance item is a Windows patch, the
    # title could be the title of the KB article for the patch; for example: Security Update for
    # Active Directory Federation Services.
    @[JSON::Field(key: "Title")]
    property title : String | Nil

    # The status of the compliance item. An item is either COMPLIANT, NON_COMPLIANT, or an empty
    # string (for Windows patches that aren't applicable).
    @[JSON::Field(key: "Status", converter: AS::ComplianceStatus)]
    property status : ComplianceStatus | Nil

    # The severity of the compliance status. Severity can be one of the following: Critical, High,
    # Medium, Low, Informational, Unspecified.
    @[JSON::Field(key: "Severity", converter: AS::ComplianceSeverity)]
    property severity : ComplianceSeverity | Nil

    # A summary for the compliance item. The summary includes an execution ID, the execution type (for
    # example, command), and the execution time.
    #
    # For State Manager associations, the `ExecutionTime` value represents when the compliance status
    # was captured and aggregated by the Systems Manager service, not necessarily when the underlying
    # association was executed on the managed node. State Manager updates compliance status for all
    # associations on an instance whenever any association executes, which means multiple associations
    # may show the same execution time even if they were executed at different times.
    @[JSON::Field(key: "ExecutionSummary")]
    property execution_summary : ComplianceExecutionSummary | Nil

    # A "Key": "Value" tag combination for the compliance item.
    @[JSON::Field(key: "Details")]
    property details : Hash(String, String) | Nil

    def initialize(
      @compliance_type : String | Nil = nil,
      @resource_type : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @id : String | Nil = nil,
      @title : String | Nil = nil,
      @status : ComplianceStatus | Nil = nil,
      @severity : ComplianceSeverity | Nil = nil,
      @execution_summary : ComplianceExecutionSummary | Nil = nil,
      @details : Hash(String, String) | Nil = nil,
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

      if value = @title
        raise Core::ValidationError.new("Title length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Title length must be <= 500") if value.size > 500
      end

      if value = @execution_summary
        value.validate!
      end
    end

    def_equals_and_hash(@compliance_type, @resource_type, @resource_id, @id, @title, @status, @severity, @execution_summary, @details)
  end
end
