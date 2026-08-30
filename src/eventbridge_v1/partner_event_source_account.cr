private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # The Amazon Web Services account that a partner event source has been offered to.
  class PartnerEventSourceAccount
    include JSON::Serializable

    # The Amazon Web Services account ID that the partner event source was offered to.
    @[JSON::Field(key: "Account")]
    property account : String | Nil

    # The date and time the event source was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    # The date and time that the event source will expire, if the Amazon Web Services account doesn't
    # create a matching event bus for it.
    @[JSON::Field(key: "ExpirationTime", converter: Core::AWSEpochConverter)]
    property expiration_time : Time | Nil

    # The state of the event source. If it is ACTIVE, you have already created a matching event bus
    # for this event source, and that event bus is active. If it is PENDING, either you haven't yet
    # created a matching event bus, or that event bus is deactivated. If it is DELETED, you have
    # created a matching event bus, but the event source has since been deleted.
    @[JSON::Field(key: "State", converter: AEB::EventSourceState)]
    property state : EventSourceState | Nil

    def initialize(
      @account : String | Nil = nil,
      @creation_time : Time | Nil = nil,
      @expiration_time : Time | Nil = nil,
      @state : EventSourceState | Nil = nil,
    )
    end

    def_equals_and_hash(@account, @creation_time, @expiration_time, @state)
  end
end
