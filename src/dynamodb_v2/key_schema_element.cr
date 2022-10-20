private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class KeySchemaElement
    include JSON::Serializable

    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String

    @[JSON::Field(key: "KeyType", converter: ADDB::KeyType)]
    property key_type : KeyType

    def initialize(
      @attribute_name : String,
      @key_type : KeyType
    )
    end
  end
end