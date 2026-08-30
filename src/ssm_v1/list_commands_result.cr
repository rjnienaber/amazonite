module Amazonite::SsmV1
  class ListCommandsResult
    include JSON::Serializable

    # (Optional) The list of commands requested by the user.
    @[JSON::Field(key: "Commands")]
    property commands : Array(Command) | Nil

    # (Optional) The token for the next set of items to return. (You received this token from a
    # previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @commands : Array(Command) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@commands, @next_token)
  end
end
