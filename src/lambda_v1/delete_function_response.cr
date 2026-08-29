module Amazonite::LambdaV1
  class DeleteFunctionResponse
    include JSON::Serializable

    @[JSON::Field(key: "StatusCode", ignore: true)]
    property status_code : Int32 | Nil

    def initialize(
      @status_code : Int32 | Nil = nil,
    )
    end
  end
end
