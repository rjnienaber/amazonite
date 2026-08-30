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
  end
end
