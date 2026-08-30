module Amazonite::CloudWatchLogsV1
  class DeleteQueryDefinitionRequest
    include JSON::Serializable

    # The ID of the query definition that you want to delete. You can use
    # [DescribeQueryDefinitions](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html)
    # to retrieve the IDs of your saved query definitions.
    @[JSON::Field(key: "queryDefinitionId")]
    property query_definition_id : String

    def initialize(
      @query_definition_id : String,
    )
    end
  end
end
