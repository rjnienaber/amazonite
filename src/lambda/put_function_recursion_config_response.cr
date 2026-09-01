private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  class PutFunctionRecursionConfigResponse
    include JSON::Serializable

    # The status of your function's recursive loop detection configuration.
    #
    # When this value is set to `Allow`and Lambda detects your function being invoked as part of a
    # recursive loop, it doesn't take any action.
    #
    # When this value is set to `Terminate` and Lambda detects your function being invoked as part of
    # a recursive loop, it stops your function being invoked and notifies you.
    @[JSON::Field(key: "RecursiveLoop", converter: AL::RecursiveLoop)]
    property recursive_loop : RecursiveLoop | Nil

    def initialize(
      @recursive_loop : RecursiveLoop | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@recursive_loop)
  end
end
