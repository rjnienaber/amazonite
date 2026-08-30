private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # A partner event source is created by an SaaS partner. If a customer creates a partner event bus
  # that matches this event source, that Amazon Web Services account can receive events from the
  # partner's applications or services.
  class EventSource
    include JSON::Serializable

    # The ARN of the event source.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The name of the partner that created the event source.
    @[JSON::Field(key: "CreatedBy")]
    property created_by : String | Nil

    # The date and time the event source was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    # The date and time that the event source will expire, if the Amazon Web Services account doesn't
    # create a matching event bus for it.
    @[JSON::Field(key: "ExpirationTime", converter: Core::AWSEpochConverter)]
    property expiration_time : Time | Nil

    # The name of the event source.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The state of the event source. If it is ACTIVE, you have already created a matching event bus
    # for this event source, and that event bus is active. If it is PENDING, either you haven't yet
    # created a matching event bus, or that event bus is deactivated. If it is DELETED, you have
    # created a matching event bus, but the event source has since been deleted.
    @[JSON::Field(key: "State", converter: AEB::EventSourceState)]
    property state : EventSourceState | Nil

    def initialize(
      @arn : String | Nil = nil,
      @created_by : String | Nil = nil,
      @creation_time : Time | Nil = nil,
      @expiration_time : Time | Nil = nil,
      @name : String | Nil = nil,
      @state : EventSourceState | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@arn, @created_by, @creation_time, @expiration_time, @name, @state)
  end
end
