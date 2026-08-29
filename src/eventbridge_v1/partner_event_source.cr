module Amazonite::EventBridgeV1
  # A partner event source is created by an SaaS partner. If a customer creates a partner event bus
  # that matches this event source, that Amazon Web Services account can receive events from the
  # partner's applications or services.
  class PartnerEventSource
    include JSON::Serializable

    # The ARN of the partner event source.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The name of the partner event source.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end
  end
end
