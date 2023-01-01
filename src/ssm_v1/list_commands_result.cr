module Amazonite::SsmV1
  class ListCommandsResult
    include JSON::Serializable

    @[JSON::Field(key: "Commands")]
    property commands : Array(Command) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @commands : Array(Command) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
