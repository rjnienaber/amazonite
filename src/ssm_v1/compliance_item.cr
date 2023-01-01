private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class ComplianceItem
    include JSON::Serializable

    @[JSON::Field(key: "ComplianceType")]
    property compliance_type : String | Nil

    @[JSON::Field(key: "ResourceType")]
    property resource_type : String | Nil

    @[JSON::Field(key: "ResourceId")]
    property resource_id : String | Nil

    @[JSON::Field(key: "Id")]
    property id : String | Nil

    @[JSON::Field(key: "Title")]
    property title : String | Nil

    @[JSON::Field(key: "Status", converter: AS::ComplianceStatus)]
    property status : ComplianceStatus | Nil

    @[JSON::Field(key: "Severity", converter: AS::ComplianceSeverity)]
    property severity : ComplianceSeverity | Nil

    @[JSON::Field(key: "ExecutionSummary")]
    property execution_summary : ComplianceExecutionSummary | Nil

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
      @details : Hash(String, String) | Nil = nil
    )
    end
  end
end
