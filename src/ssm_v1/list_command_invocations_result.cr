module Amazonite::SsmV1
  class ListCommandInvocationsResult
    include JSON::Serializable

    @[JSON::Field(key: "CommandInvocations")]
    property command_invocations : Array(CommandInvocation) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @command_invocations : Array(CommandInvocation) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
