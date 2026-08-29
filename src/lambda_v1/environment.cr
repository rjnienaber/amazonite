module Amazonite::LambdaV1
  class Environment
    include JSON::Serializable

    @[JSON::Field(key: "Variables")]
    property variables : Hash(String, String) | Nil

    def initialize(
      @variables : Hash(String, String) | Nil = nil,
    )
    end
  end
end
