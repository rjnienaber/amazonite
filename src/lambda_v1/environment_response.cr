module Amazonite::LambdaV1
  class EnvironmentResponse
    include JSON::Serializable

    @[JSON::Field(key: "Variables")]
    property variables : Hash(String, String) | Nil

    @[JSON::Field(key: "Error")]
    property error : EnvironmentError | Nil

    def initialize(
      @variables : Hash(String, String) | Nil = nil,
      @error : EnvironmentError | Nil = nil,
    )
    end
  end
end
