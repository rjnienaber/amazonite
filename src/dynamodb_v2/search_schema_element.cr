private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class SearchSchemaElement
    include JSON::Serializable

    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String

    @[JSON::Field(key: "SearchSchemaElementType", converter: ADDB::SearchSchemaElementType)]
    property search_schema_element_type : SearchSchemaElementType

    def initialize(
      @attribute_name : String,
      @search_schema_element_type : SearchSchemaElementType,
    )
    end
  end
end
