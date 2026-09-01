module Amazonite::EventBridge
  class CreatePartnerEventSourceResponse
    include JSON::Serializable

    # The ARN of the partner event source.
    @[JSON::Field(key: "EventSourceArn")]
    property event_source_arn : String | Nil

    def initialize(
      @event_source_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@event_source_arn)
  end
end
