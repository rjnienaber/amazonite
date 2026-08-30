private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents an attribute for describing the schema for the table and indexes.
  class AttributeDefinition
    include JSON::Serializable

    # A name for the attribute.
    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String

    # The data type for the attribute, where:
    #
    # - `S` - the attribute is of type String
    #
    # - `N` - the attribute is of type Number
    #
    # - `B` - the attribute is of type Binary
    @[JSON::Field(key: "AttributeType", converter: ADDB::ScalarAttributeType)]
    property attribute_type : ScalarAttributeType

    def initialize(
      @attribute_name : String,
      @attribute_type : ScalarAttributeType,
    )
    end
  end
end
