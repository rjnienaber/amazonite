module Amazonite::CloudWatchLogsV1
  class ListSourcesForS3TableIntegrationResponse
    include JSON::Serializable

    # The list of data source associations for the specified S3 Table Integration.
    @[JSON::Field(key: "sources")]
    property sources : Array(S3TableIntegrationSource) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @sources : Array(S3TableIntegrationSource) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
