private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class AttributeDefinition
    include JSON::Serializable

    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String

    @[JSON::Field(key: "AttributeType", converter: ADDB::ScalarAttributeType)]
    property attribute_type : ScalarAttributeType

    def initialize(
      @attribute_name : String,
      @attribute_type : ScalarAttributeType
    )
    end
  end
end
