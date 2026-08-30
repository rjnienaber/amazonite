private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Contains the configuration of a vector index as it existed at the time a backup was created.
  class VectorIndexInfo
    include JSON::Serializable

    # The name of the vector index.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    # The vector attribute configuration for the index.
    @[JSON::Field(key: "VectorAttribute")]
    property vector_attribute : VectorAttributeDefinition | Nil

    # The search schema that defines partition key and inline filter attributes for the vector index.
    @[JSON::Field(key: "SearchSchema")]
    property search_schema : Array(SearchSchemaElement) | Nil

    # Specifies attributes that are copied (projected) from the table into the vector index.
    @[JSON::Field(key: "Projection")]
    property projection : Projection | Nil

    # The number of dimensions in each vector.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Int64 | Nil

    # The distance function used to calculate similarity between vectors.
    @[JSON::Field(key: "DistanceFunction", converter: ADDB::VectorDistanceFunction)]
    property distance_function : VectorDistanceFunction | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @vector_attribute : VectorAttributeDefinition | Nil = nil,
      @search_schema : Array(SearchSchemaElement) | Nil = nil,
      @projection : Projection | Nil = nil,
      @dimensions : Int64 | Nil = nil,
      @distance_function : VectorDistanceFunction | Nil = nil,
    )
    end
  end
end
