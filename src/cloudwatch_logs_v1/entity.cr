private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # The entity associated with the log events in a `PutLogEvents` call.
  class Entity
    include JSON::Serializable

    # The attributes of the entity which identify the specific entity, as a list of key-value pairs.
    # Entities with the same `keyAttributes` are considered to be the same entity.
    #
    # There are five allowed attributes (key names): `Type`, `ResourceType`, `Identifier` `Name`, and
    # `Environment`.
    #
    # For details about how to use the key attributes, see [How to add related information to
    # telemetry](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/adding-your-own-related-telemetry.html)
    # in the *CloudWatch User Guide*.
    @[JSON::Field(key: "keyAttributes")]
    property key_attributes : Hash(String, String) | Nil

    # Additional attributes of the entity that are not used to specify the identity of the entity. A
    # list of key-value pairs.
    #
    # For details about how to use the attributes, see [How to add related information to
    # telemetry](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/adding-your-own-related-telemetry.html)
    # in the *CloudWatch User Guide*.
    @[JSON::Field(key: "attributes")]
    property attributes : Hash(String, String) | Nil

    def initialize(
      @key_attributes : Hash(String, String) | Nil = nil,
      @attributes : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_attributes
        raise Core::ValidationError.new("keyAttributes must have at least 2 entry(s)") if value.size < 2
        raise Core::ValidationError.new("keyAttributes must have at most 4 entry(s)") if value.size > 4
      end

      if value = @attributes
        raise Core::ValidationError.new("attributes must have at least 0 entry(s)") if value.size < 0
        raise Core::ValidationError.new("attributes must have at most 10 entry(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@key_attributes, @attributes)
  end
end
