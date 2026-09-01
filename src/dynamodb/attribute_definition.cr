private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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

    def validate! : Nil
      if value = @attribute_name
        raise Core::ValidationError.new("AttributeName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AttributeName length must be <= 255") if value.size > 255
      end
    end

    def_equals_and_hash(@attribute_name, @attribute_type)
  end
end
