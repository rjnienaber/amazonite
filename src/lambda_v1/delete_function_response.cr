module Amazonite::LambdaV1
  class DeleteFunctionResponse
    include JSON::Serializable

    # The HTTP status code returned by the operation.
    @[JSON::Field(key: "StatusCode", ignore: true)]
    property status_code : Int32 | Nil

    def initialize(
      @status_code : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@status_code)
  end
end
