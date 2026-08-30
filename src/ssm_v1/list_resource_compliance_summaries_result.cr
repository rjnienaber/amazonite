module Amazonite::SsmV1
  class ListResourceComplianceSummariesResult
    include JSON::Serializable

    # A summary count for specified or targeted managed nodes. Summary count includes information
    # about compliant and non-compliant State Manager associations, patch status, or custom items
    # according to the filter criteria that you specify.
    @[JSON::Field(key: "ResourceComplianceSummaryItems")]
    property resource_compliance_summary_items : Array(ResourceComplianceSummaryItem) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @resource_compliance_summary_items : Array(ResourceComplianceSummaryItem) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@resource_compliance_summary_items, @next_token)
  end
end
