private alias Core = Amazonite::Core

module Amazonite::EventBridge
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

    # If the event bus was created on behalf of your account by an Amazon Web Services service, this
    # field displays the principal name of the service that created the event bus.
    @[JSON::Field(key: "ManagedBy")]
    property managed_by : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @arn : String | Nil = nil,
      @description : String | Nil = nil,
      @policy : String | Nil = nil,
      @creation_time : Time | Nil = nil,
      @last_modified_time : Time | Nil = nil,
      @managed_by : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 512") if value.size > 512
      end

      if value = @managed_by
        raise Core::ValidationError.new("ManagedBy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ManagedBy length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@name, @arn, @description, @policy, @creation_time, @last_modified_time, @managed_by)
  end
end
