module Amazonite::DynamoDBV2
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

    def_equals_and_hash(@attribute_name)
  end
end
