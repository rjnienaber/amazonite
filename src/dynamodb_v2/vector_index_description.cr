private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Contains the current state and configuration of a vector index, including its status, size, item
  # count, and the settings specified when the index was created.
  class VectorIndexDescription
    include JSON::Serializable

    # The name of the vector index.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    # The search schema that defines partition key and inline filter attributes for the vector index.
    @[JSON::Field(key: "SearchSchema")]
    property search_schema : Array(SearchSchemaElement) | Nil

    # Specifies attributes that are copied (projected) from the table into the vector index.
    @[JSON::Field(key: "Projection")]
    property projection : Projection | Nil

    # The vector attribute configuration for the index.
    @[JSON::Field(key: "VectorAttribute")]
    property vector_attribute : VectorAttributeDefinition | Nil

    # The number of dimensions in each vector.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Int64 | Nil

    # The distance function used to calculate similarity between vectors.
    @[JSON::Field(key: "DistanceFunction", converter: ADDB::VectorDistanceFunction)]
    property distance_function : VectorDistanceFunction | Nil

    # The current state of the vector index:
    #
    # - `CREATING` - The index is being created.
    #
    # - `ACTIVE` - The index is ready for use.
    #
    # - `DELETING` - The index is being deleted.
    @[JSON::Field(key: "IndexStatus", converter: ADDB::IndexStatus)]
    property index_status : IndexStatus | Nil

    # Specifies whether the index is currently backfilling. During backfill, `SearchVectors`
    # operations might return incomplete results.
    @[JSON::Field(key: "Backfilling")]
    property backfilling : Bool | Nil

    # The total size of the vector index, in bytes. Amazon DynamoDB updates this value approximately
    # every six hours. Recent changes might not be reflected in this value.
    @[JSON::Field(key: "IndexSizeBytes")]
    property index_size_bytes : Int64 | Nil

    # The number of items indexed in the vector index. Amazon DynamoDB updates this value
    # approximately every six hours. Recent changes might not be reflected in this value.
    @[JSON::Field(key: "ItemCount")]
    property item_count : Int64 | Nil

    # The Amazon Resource Name (ARN) that uniquely identifies the vector index.
    @[JSON::Field(key: "IndexArn")]
    property index_arn : String | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @search_schema : Array(SearchSchemaElement) | Nil = nil,
      @projection : Projection | Nil = nil,
      @vector_attribute : VectorAttributeDefinition | Nil = nil,
      @dimensions : Int64 | Nil = nil,
      @distance_function : VectorDistanceFunction | Nil = nil,
      @index_status : IndexStatus | Nil = nil,
      @backfilling : Bool | Nil = nil,
      @index_size_bytes : Int64 | Nil = nil,
      @item_count : Int64 | Nil = nil,
      @index_arn : String | Nil = nil,
    )
    end

    def_equals_and_hash(@index_name, @search_schema, @projection, @vector_attribute, @dimensions, @distance_function, @index_status, @backfilling, @index_size_bytes, @item_count, @index_arn)
  end
end
