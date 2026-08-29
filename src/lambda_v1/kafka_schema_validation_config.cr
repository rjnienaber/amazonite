private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class KafkaSchemaValidationConfig
    include JSON::Serializable

    @[JSON::Field(key: "Attribute", converter: AL::KafkaSchemaValidationAttribute)]
    property attribute : KafkaSchemaValidationAttribute | Nil

    def initialize(
      @attribute : KafkaSchemaValidationAttribute | Nil = nil,
    )
    end
  end
end
