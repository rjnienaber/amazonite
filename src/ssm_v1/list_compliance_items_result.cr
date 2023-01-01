module Amazonite::SsmV1
  class ListComplianceItemsResult
    include JSON::Serializable

    @[JSON::Field(key: "ComplianceItems")]
    property compliance_items : Array(ComplianceItem) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @compliance_items : Array(ComplianceItem) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
