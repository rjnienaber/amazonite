private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # Specific access configuration settings that tell Lambda how to authenticate with your schema
  # registry.
  #
  # If you're working with an Glue schema registry, don't provide authentication details in this
  # object. Instead, ensure that your execution role has the required permissions for Lambda to
  # access your cluster.
  #
  # If you're working with a Confluent schema registry, choose the authentication method in the
  # `Type` field, and provide the Secrets Manager secret ARN in the `URI` field.
  class KafkaSchemaRegistryAccessConfig
    include JSON::Serializable

    # The type of authentication Lambda uses to access your schema registry.
    @[JSON::Field(key: "Type", converter: AL::KafkaSchemaRegistryAuthType)]
    property type : KafkaSchemaRegistryAuthType | Nil

    # The URI of the secret (Secrets Manager secret ARN) to authenticate with your schema registry.
    @[JSON::Field(key: "URI")]
    property uri : String | Nil

    def initialize(
      @type : KafkaSchemaRegistryAuthType | Nil = nil,
      @uri : String | Nil = nil,
    )
    end
  end
end
