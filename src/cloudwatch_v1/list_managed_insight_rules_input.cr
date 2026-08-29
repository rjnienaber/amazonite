module Amazonite::CloudWatchV1
  class ListManagedInsightRulesInput
    include JSON::Serializable

    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @resource_arn : String,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end
  end
end
