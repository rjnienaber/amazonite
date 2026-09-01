private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DescribeQueryDefinitionsResponse
    include JSON::Serializable

    # The list of query definitions that match your request.
    @[JSON::Field(key: "queryDefinitions")]
    property query_definitions : Array(QueryDefinition) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @query_definitions : Array(QueryDefinition) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @query_definitions
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@query_definitions, @next_token)
  end
end
