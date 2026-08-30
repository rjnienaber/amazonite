module Amazonite::CloudWatchLogsV1
  class ListSourcesForS3TableIntegrationRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the S3 Table Integration to list associations for.
    @[JSON::Field(key: "integrationArn")]
    property integration_arn : String

    # The maximum number of associations to return in a single call. Valid range is 1 to 100.
    @[JSON::Field(key: "maxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @integration_arn : String,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
