module Amazonite::CloudWatchV1
  # An entity associated with metrics, to allow for finding related telemetry. An entity is
  # typically a resource or service within your system. For example, metrics from an Amazon EC2
  # instance could be associated with that instance as the entity. Similarly, metrics from a service
  # that you own could be associated with that service as the entity.
  class Entity
    include JSON::Serializable

    # The attributes of the entity which identify the specific entity, as a list of key-value pairs.
    # Entities with the same `KeyAttributes` are considered to be the same entity. For an entity to be
    # valid, the `KeyAttributes` must exist and be formatted correctly.
    #
    # There are five allowed attributes (key names): `Type`, `ResourceType`, `Identifier`, `Name`, and
    # `Environment`.
    #
    # For details about how to use the key attributes to specify an entity, see [How to add related
    # information to
    # telemetry](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/adding-your-own-related-telemetry.html)
    # in the *CloudWatch User Guide*.
    @[JSON::Field(key: "KeyAttributes")]
    property key_attributes : Hash(String, String) | Nil

    # Additional attributes of the entity that are not used to specify the identity of the entity. A
    # list of key-value pairs.
    #
    # For details about how to use the attributes, see [How to add related information to
    # telemetry](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/adding-your-own-related-telemetry.html)
    # in the *CloudWatch User Guide*.
    @[JSON::Field(key: "Attributes")]
    property attributes : Hash(String, String) | Nil

    def initialize(
      @key_attributes : Hash(String, String) | Nil = nil,
      @attributes : Hash(String, String) | Nil = nil,
    )
    end

    def_equals_and_hash(@key_attributes, @attributes)
  end
end
