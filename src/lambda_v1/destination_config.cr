module Amazonite::LambdaV1
  # A configuration object that specifies the destination of an event after Lambda processes it. For
  # more information, see [Adding a
  # destination](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async-retain-records.html#invocation-async-destinations).
  class DestinationConfig
    include JSON::Serializable

    # The destination configuration for successful invocations. Not supported in
    # `CreateEventSourceMapping` or `UpdateEventSourceMapping`.
    @[JSON::Field(key: "OnSuccess")]
    property on_success : OnSuccess | Nil

    # The destination configuration for failed invocations.
    @[JSON::Field(key: "OnFailure")]
    property on_failure : OnFailure | Nil

    def initialize(
      @on_success : OnSuccess | Nil = nil,
      @on_failure : OnFailure | Nil = nil,
    )
    end
  end
end
