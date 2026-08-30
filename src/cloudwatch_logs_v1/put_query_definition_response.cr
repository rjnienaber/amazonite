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

    def_equals_and_hash(@query_definition_id)
  end
end
