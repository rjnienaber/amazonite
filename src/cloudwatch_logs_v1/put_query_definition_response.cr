module Amazonite::CloudWatchLogsV1
  class PutQueryDefinitionResponse
    include JSON::Serializable

    # The ID of the query definition.
    @[JSON::Field(key: "queryDefinitionId")]
    property query_definition_id : String | Nil

    def initialize(
      @query_definition_id : String | Nil = nil,
    )
    end
  end
end
