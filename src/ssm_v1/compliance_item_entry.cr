private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # Information about a compliance item.
  class ComplianceItemEntry
    include JSON::Serializable

    # The compliance item ID. For example, if the compliance item is a Windows patch, the ID could be
    # the number of the KB article.
    @[JSON::Field(key: "Id")]
    property id : String | Nil

    # The title of the compliance item. For example, if the compliance item is a Windows patch, the
    # title could be the title of the KB article for the patch; for example: Security Update for
    # Active Directory Federation Services.
    @[JSON::Field(key: "Title")]
    property title : String | Nil

    # The severity of the compliance status. Severity can be one of the following: Critical, High,
    # Medium, Low, Informational, Unspecified.
    @[JSON::Field(key: "Severity", converter: AS::ComplianceSeverity)]
    property severity : ComplianceSeverity

    # The status of the compliance item. An item is either COMPLIANT or NON_COMPLIANT.
    @[JSON::Field(key: "Status", converter: AS::ComplianceStatus)]
    property status : ComplianceStatus

    # A "Key": "Value" tag combination for the compliance item.
    @[JSON::Field(key: "Details")]
    property details : Hash(String, String) | Nil

    def initialize(
      @severity : ComplianceSeverity,
      @status : ComplianceStatus,
      @id : String | Nil = nil,
      @title : String | Nil = nil,
      @details : Hash(String, String) | Nil = nil,
    )
    end
  end
end
