module Amazonite::SsmV1
  class GetOpsSummaryResult
    include JSON::Serializable

    @[JSON::Field(key: "Entities")]
    property entities : Array(OpsEntity) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @entities : Array(OpsEntity) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
