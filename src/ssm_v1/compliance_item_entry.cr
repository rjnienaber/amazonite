private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class ComplianceItemEntry
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String | Nil

    @[JSON::Field(key: "Title")]
    property title : String | Nil

    @[JSON::Field(key: "Severity", converter: AS::ComplianceSeverity)]
    property severity : ComplianceSeverity

    @[JSON::Field(key: "Status", converter: AS::ComplianceStatus)]
    property status : ComplianceStatus

    @[JSON::Field(key: "Details")]
    property details : Hash(String, String) | Nil

    def initialize(
      @severity : ComplianceSeverity,
      @status : ComplianceStatus,
      @id : String | Nil = nil,
      @title : String | Nil = nil,
      @details : Hash(String, String) | Nil = nil
    )
    end
  end
end
