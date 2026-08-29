module Amazonite::LambdaV1
  class ChainedInvokeDetails
    include JSON::Serializable

    @[JSON::Field(key: "Result")]
    property result : String | Nil

    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    def initialize(
      @result : String | Nil = nil,
      @error : ErrorObject | Nil = nil,
    )
    end
  end
end
