module Amazonite::LambdaV1
  class InvokeWithResponseStreamResponse
    include JSON::Serializable

    # For a successful request, the HTTP status code is in the 200 range. For the `RequestResponse`
    # invocation type, this status code is 200. For the `DryRun` invocation type, this status code is
    # 204.
    @[JSON::Field(key: "StatusCode", ignore: true)]
    property status_code : Int32 | Nil

    # The version of the function that executed. When you invoke a function with an alias, this
    # indicates which version the alias resolved to.
    @[JSON::Field(key: "ExecutedVersion", ignore: true)]
    property executed_version : String | Nil

    # The stream of response payloads.
    @[JSON::Field(key: "EventStream")]
    property event_stream : InvokeWithResponseStreamResponseEvent | Nil

    # The type of data the stream is returning.
    @[JSON::Field(key: "ResponseStreamContentType", ignore: true)]
    property response_stream_content_type : String | Nil

    def initialize(
      @status_code : Int32 | Nil = nil,
      @executed_version : String | Nil = nil,
      @event_stream : InvokeWithResponseStreamResponseEvent | Nil = nil,
      @response_stream_content_type : String | Nil = nil,
    )
    end

    def_equals_and_hash(@status_code, @executed_version, @event_stream, @response_stream_content_type)
  end
end
