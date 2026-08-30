private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("maxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("maxResults value must be <= 100") if value > 100
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@integration_arn, @max_results, @next_token)
  end
end
