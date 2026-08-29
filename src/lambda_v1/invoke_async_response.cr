module Amazonite::LambdaV1
  # A success response (`202 Accepted`) indicates that the request is queued for invocation.
  class InvokeAsyncResponse
    include JSON::Serializable

    # The status code.
    @[JSON::Field(key: "Status", ignore: true)]
    property status : Int32 | Nil

    def initialize(
      @status : Int32 | Nil = nil,
    )
    end
  end
end
