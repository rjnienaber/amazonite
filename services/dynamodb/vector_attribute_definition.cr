private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # The definition of a vector attribute for a vector index.
  class VectorAttributeDefinition
    include JSON::Serializable

    # The name of the vector attribute.
    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String

    def initialize(
      @attribute_name : String,
    )
    end

    def validate! : Nil
      if value = @attribute_name
        raise Core::ValidationError.new("AttributeName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AttributeName length must be <= 255") if value.size > 255
      end
    end

    def_equals_and_hash(@attribute_name)
  end
end
