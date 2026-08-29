module Amazonite::DynamoDBV2
  class VectorAttributeDefinition
    include JSON::Serializable

    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String

    def initialize(
      @attribute_name : String,
    )
    end
  end
end
