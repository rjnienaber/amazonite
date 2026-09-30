private alias Core = Amazonite::Core

module Amazonite::Lambda
  # A destination for events that were processed successfully.
  #
  # To retain records of successful [asynchronous
  # invocations](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-async-destinations),
  # you can configure an Amazon SNS topic, Amazon SQS queue, Lambda function, or Amazon EventBridge
  # event bus as the destination.
  #
  # `OnSuccess` is not supported in `CreateEventSourceMapping` or `UpdateEventSourceMapping`
  # requests.
  class OnSuccess
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the destination resource.
    #
    # Amazon SNS destinations have a message size limit of 256 KB. If the combined size of the
    # function request and response payload exceeds the limit, Lambda will drop the payload when
    # sending `OnFailure` event to the destination. For details on this behavior, refer to [Retaining
    # records of asynchronous
    # invocations](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async-retain-records.html).
    @[JSON::Field(key: "Destination")]
    property destination : String | Nil

    def initialize(
      @destination : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @destination
        raise Core::ValidationError.new("Destination length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Destination length must be <= 350") if value.size > 350
        raise Core::ValidationError.new("Destination does not match the required pattern") unless value.matches?(Regex.new("^$|kafka://([^.]([a-zA-Z0-9\\-_.]{0,248}))|arn:(aws[a-zA-Z0-9-]*):([a-zA-Z0-9\\-])+:((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1})?:(\\d{12})?:(.*)$"))
      end
    end

    def_equals_and_hash(@destination)
  end
end
