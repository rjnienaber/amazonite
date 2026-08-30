private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @sources
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@sources, @next_token)
  end
end
