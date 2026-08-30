private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # Specific schema validation configuration settings that tell Lambda the message attributes you
  # want to validate and filter using your schema registry.
  class KafkaSchemaValidationConfig
    include JSON::Serializable

    # The attributes you want your schema registry to validate and filter for. If you selected `JSON`
    # as the `EventRecordFormat`, Lambda also deserializes the selected message attributes.
    @[JSON::Field(key: "Attribute", converter: AL::KafkaSchemaValidationAttribute)]
    property attribute : KafkaSchemaValidationAttribute | Nil

    def initialize(
      @attribute : KafkaSchemaValidationAttribute | Nil = nil,
    )
    end

    def_equals_and_hash(@attribute)
  end
end
