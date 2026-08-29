private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class VectorIndexDescription
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "SearchSchema")]
    property search_schema : Array(SearchSchemaElement) | Nil

    @[JSON::Field(key: "Projection")]
    property projection : Projection | Nil

    @[JSON::Field(key: "VectorAttribute")]
    property vector_attribute : VectorAttributeDefinition | Nil

    @[JSON::Field(key: "Dimensions")]
    property dimensions : Int64 | Nil

    @[JSON::Field(key: "DistanceFunction", converter: ADDB::VectorDistanceFunction)]
    property distance_function : VectorDistanceFunction | Nil

    @[JSON::Field(key: "IndexStatus", converter: ADDB::IndexStatus)]
    property index_status : IndexStatus | Nil

    @[JSON::Field(key: "Backfilling")]
    property backfilling : Bool | Nil

    @[JSON::Field(key: "IndexSizeBytes")]
    property index_size_bytes : Int64 | Nil

    @[JSON::Field(key: "ItemCount")]
    property item_count : Int64 | Nil

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
  end
end
