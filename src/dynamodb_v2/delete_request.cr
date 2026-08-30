private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents a request to perform a `DeleteItem` operation on an item.
  class DeleteRequest
    include JSON::Serializable

    # A map of attribute name to attribute values, representing the primary key of the item to delete.
    # All of the table's primary key attributes must be specified, and their data types must match
    # those of the table's key schema.
    @[JSON::Field(key: "Key")]
    property key : Hash(String, AttributeValue)

    def initialize(
      @key : Hash(String, AttributeValue),
    )
    end

    def validate! : Nil
      if value = @key
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@key)
  end
end
