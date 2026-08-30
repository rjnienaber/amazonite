private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class GetFunctionRecursionConfigResponse
    include JSON::Serializable

    # If your function's recursive loop detection configuration is `Allow`, Lambda doesn't take any
    # action when it detects your function being invoked as part of a recursive loop.
    #
    # If your function's recursive loop detection configuration is `Terminate`, Lambda stops your
    # function being invoked and notifies you when it detects your function being invoked as part of a
    # recursive loop.
    #
    # By default, Lambda sets your function's configuration to `Terminate`. You can update this
    # configuration using the PutFunctionRecursionConfig action.
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
