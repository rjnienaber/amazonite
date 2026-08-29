private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class KafkaSchemaRegistryAccessConfig
    include JSON::Serializable

    @[JSON::Field(key: "Type", converter: AL::KafkaSchemaRegistryAuthType)]
    property type : KafkaSchemaRegistryAuthType | Nil

    @[JSON::Field(key: "URI")]
    property uri : String | Nil

    def initialize(
      @type : KafkaSchemaRegistryAuthType | Nil = nil,
      @uri : String | Nil = nil,
    )
    end
  end
end
