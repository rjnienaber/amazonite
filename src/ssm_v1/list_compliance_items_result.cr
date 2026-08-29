module Amazonite::SsmV1
  class ListComplianceItemsResult
    include JSON::Serializable

    # A list of compliance information for the specified resource ID.
    @[JSON::Field(key: "ComplianceItems")]
    property compliance_items : Array(ComplianceItem) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @compliance_items : Array(ComplianceItem) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
