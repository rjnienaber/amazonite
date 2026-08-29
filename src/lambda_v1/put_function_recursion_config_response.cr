private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class PutFunctionRecursionConfigResponse
    include JSON::Serializable

    @[JSON::Field(key: "RecursiveLoop", converter: AL::RecursiveLoop)]
    property recursive_loop : RecursiveLoop | Nil

    def initialize(
      @recursive_loop : RecursiveLoop | Nil = nil,
    )
    end
  end
end
