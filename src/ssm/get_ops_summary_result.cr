private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetOpsSummaryResult
    include JSON::Serializable

    # The list of aggregated details and filtered OpsData.
    @[JSON::Field(key: "Entities")]
    property entities : Array(OpsEntity) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @entities : Array(OpsEntity) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @entities
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@entities, @next_token)
  end
end
