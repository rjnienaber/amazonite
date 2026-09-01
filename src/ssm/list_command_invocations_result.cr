private alias Core = Amazonite::Core

module Amazonite::Ssm
  class ListCommandInvocationsResult
    include JSON::Serializable

    # (Optional) A list of all invocations.
    @[JSON::Field(key: "CommandInvocations")]
    property command_invocations : Array(CommandInvocation) | Nil

    # (Optional) The token for the next set of items to return. (You received this token from a
    # previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @command_invocations : Array(CommandInvocation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @command_invocations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@command_invocations, @next_token)
  end
end
