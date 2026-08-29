module Amazonite::LambdaV1
  class InvokeWithResponseStreamResponse
    include JSON::Serializable

    @[JSON::Field(key: "StatusCode", ignore: true)]
    property status_code : Int32 | Nil

    @[JSON::Field(key: "ExecutedVersion", ignore: true)]
    property executed_version : String | Nil

    @[JSON::Field(key: "EventStream")]
    property event_stream : InvokeWithResponseStreamResponseEvent | Nil

    @[JSON::Field(key: "ResponseStreamContentType", ignore: true)]
    property response_stream_content_type : String | Nil

    def initialize(
      @status_code : Int32 | Nil = nil,
      @executed_version : String | Nil = nil,
      @event_stream : InvokeWithResponseStreamResponseEvent | Nil = nil,
      @response_stream_content_type : String | Nil = nil,
    )
    end
  end
end
