private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # Represents the results of an event submitted to an event bus.
  #
  # If the submission was successful, the entry has the event ID in it. Otherwise, you can use the
  # error code and error message to identify the problem with the entry.
  #
  # For information about the errors that are common to all actions, see [Common
  # Errors](https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html).
  class PutEventsResultEntry
    include JSON::Serializable

    # The ID of the event.
    @[JSON::Field(key: "EventId")]
    property event_id : String | Nil

    # The error code that indicates why the event submission failed.
    #
    # Retryable errors include:
    #
    # - `
    # [InternalFailure](https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html)
    # `
    #
    # The request processing has failed because of an unknown error, exception or failure.
    #
    # - `
    # [ThrottlingException](https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html)
    # `
    #
    # The request was denied due to request throttling.
    #
    # Non-retryable errors include:
    #
    # - `
    # [AccessDeniedException](https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html)
    # `
    #
    # You do not have sufficient access to perform this action.
    #
    # - `InvalidAccountIdException`
    #
    # The account ID provided is not valid.
    #
    # - `InvalidArgument`
    #
    # A specified parameter is not valid.
    #
    # - `MalformedDetail`
    #
    # The JSON provided is not valid.
    #
    # - `RedactionFailure`
    #
    # Redacting the CloudTrail event failed.
    #
    # - `NotAuthorizedForSourceException`
    #
    # You do not have permissions to publish events with this source onto this event bus.
    #
    # - `NotAuthorizedForDetailTypeException`
    #
    # You do not have permissions to publish events with this detail type onto this event bus.
    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    # The error message that explains why the event submission failed.
    @[JSON::Field(key: "ErrorMessage")]
    property error_message : String | Nil

    def initialize(
      @event_id : String | Nil = nil,
      @error_code : String | Nil = nil,
      @error_message : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @event_id
        raise Core::ValidationError.new("EventId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("EventId length must be <= 64") if value.size > 64
      end
    end

    def_equals_and_hash(@event_id, @error_code, @error_message)
  end
end
