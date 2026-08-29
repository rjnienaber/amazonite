module Amazonite::LambdaV1
  class EnvironmentError
    include JSON::Serializable

    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @error_code : String | Nil = nil,
      @message : String | Nil = nil,
    )
    end
  end
end
