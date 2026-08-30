private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents the input of a `BatchWriteItem` operation.
  class BatchWriteItemInput
    include JSON::Serializable

    # A map of one or more table names or table ARNs and, for each table, a list of operations to be
    # performed (`DeleteRequest` or `PutRequest`). Each element in the map consists of the following:
    #
    # - `DeleteRequest` - Perform a `DeleteItem` operation on the specified item. The item to be
    # deleted is identified by a `Key` subelement:
    #
    # - `Key` - A map of primary key attribute values that uniquely identify the item. Each entry in
    # this map consists of an attribute name and an attribute value. For each primary key, you must
    # provide *all* of the key attributes. For example, with a simple primary key, you only need to
    # provide a value for the partition key. For a composite primary key, you must provide values for
    # *both* the partition key and the sort key.
    #
    # - `PutRequest` - Perform a `PutItem` operation on the specified item. The item to be put is
    # identified by an `Item` subelement:
    #
    # - `Item` - A map of attributes and their values. Each entry in this map consists of an attribute
    # name and an attribute value. Attribute values must not be null; string and binary type
    # attributes must have lengths greater than zero; and set type attributes must not be empty.
    # Requests that contain empty values are rejected with a `ValidationException` exception.
    #
    # If you specify any attributes that are part of an index key, then the data types for those
    # attributes must match those of the schema in the table's attribute definition.
    @[JSON::Field(key: "RequestItems")]
    property request_items : Hash(String, Array(WriteRequest))

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    # Determines whether item collection metrics are returned. If set to `SIZE`, the response includes
    # statistics about item collections, if any, that were modified during the operation are returned
    # in the response. If set to `NONE` (the default), no statistics are returned.
    @[JSON::Field(key: "ReturnItemCollectionMetrics", converter: ADDB::ReturnItemCollectionMetrics)]
    property return_item_collection_metrics : ReturnItemCollectionMetrics | Nil

    def initialize(
      @request_items : Hash(String, Array(WriteRequest)),
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @return_item_collection_metrics : ReturnItemCollectionMetrics | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @request_items
        raise Core::ValidationError.new("RequestItems must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("RequestItems must have at most 25 entry(s)") if value.size > 25
      end
    end

    def_equals_and_hash(@request_items, @return_consumed_capacity, @return_item_collection_metrics)
  end
end
