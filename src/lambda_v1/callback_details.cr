module Amazonite::LambdaV1
  class CallbackDetails
    include JSON::Serializable

    @[JSON::Field(key: "CallbackId")]
    property callback_id : String | Nil

    @[JSON::Field(key: "Result")]
    property result : String | Nil

    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    def initialize(
      @callback_id : String | Nil = nil,
      @result : String | Nil = nil,
      @error : ErrorObject | Nil = nil,
    )
    end
  end
end
