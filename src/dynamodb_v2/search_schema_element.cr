private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # An element in the search schema of a vector index.
  class SearchSchemaElement
    include JSON::Serializable

    # The name of the attribute.
    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String

    # The role of the attribute in the search schema. Valid values:
    #
    # - `HASH` - A partition key that partitions the vector index for independent scaling. When
    # specified, you must provide this attribute's value in the `SearchConditionExpression`.
    #
    # - `INLINE_FILTER` - An attribute projected into the vector index for filtering at the storage
    # layer during search. Inline filters are optional in the `SearchConditionExpression`.
    @[JSON::Field(key: "SearchSchemaElementType", converter: ADDB::SearchSchemaElementType)]
    property search_schema_element_type : SearchSchemaElementType

    def initialize(
      @attribute_name : String,
      @search_schema_element_type : SearchSchemaElementType,
    )
    end

    def validate! : Nil
      if value = @attribute_name
        raise Core::ValidationError.new("AttributeName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("AttributeName length must be <= 65535") if value.size > 65535
      end
    end

    def_equals_and_hash(@attribute_name, @search_schema_element_type)
  end
end
