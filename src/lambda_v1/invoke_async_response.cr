module Amazonite::LambdaV1
  class InvokeAsyncResponse
    include JSON::Serializable

    @[JSON::Field(key: "Status", ignore: true)]
    property status : Int32 | Nil

    def initialize(
      @status : Int32 | Nil = nil,
    )
    end
  end
end
