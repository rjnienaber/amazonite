module Amazonite::LambdaV1
  class ExecutionDetails
    include JSON::Serializable

    @[JSON::Field(key: "InputPayload")]
    property input_payload : String | Nil

    def initialize(
      @input_payload : String | Nil = nil,
    )
    end
  end
end
