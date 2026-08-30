private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # An event bus receives events from a source, uses rules to evaluate them, applies any configured
  # input transformation, and routes them to the appropriate target(s). Your account's default event
  # bus receives events from Amazon Web Services services. A custom event bus can receive events
  # from your custom applications and services. A partner event bus receives events from an event
  # source created by an SaaS partner. These events come from the partners services or applications.
  class EventBus
    include JSON::Serializable

    # The name of the event bus.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The ARN of the event bus.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The event bus description.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The permissions policy of the event bus, describing which other Amazon Web Services accounts can
    # write events to this event bus.
    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    # The time the event bus was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    # The time the event bus was last modified.
    @[JSON::Field(key: "LastModifiedTime", converter: Core::AWSEpochConverter)]
    property last_modified_time : Time | Nil

    def initialize(
      @name : String | Nil = nil,
      @arn : String | Nil = nil,
      @description : String | Nil = nil,
      @policy : String | Nil = nil,
      @creation_time : Time | Nil = nil,
      @last_modified_time : Time | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @arn, @description, @policy, @creation_time, @last_modified_time)
  end
end
