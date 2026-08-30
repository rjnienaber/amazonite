private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Contains the configuration settings for a vector index, including the index name, vector
  # attribute, dimensions, distance function, search schema, and projection.
  class VectorIndex
    include JSON::Serializable

    # The name of the vector index.
    @[JSON::Field(key: "IndexName")]
    property index_name : String

    # The vector attribute configuration for the index.
    @[JSON::Field(key: "VectorAttribute")]
    property vector_attribute : VectorAttributeDefinition

    # The search schema that defines partition key and inline filter attributes for the vector index.
    @[JSON::Field(key: "SearchSchema")]
    property search_schema : Array(SearchSchemaElement) | Nil

    # Specifies attributes that are copied (projected) from the table into the vector index.
    @[JSON::Field(key: "Projection")]
    property projection : Projection

    # The number of dimensions in each vector.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Int64

    # The distance function used to calculate similarity between vectors. Valid values: `COSINE`,
    # `EUCLIDEAN`, `DOT_PRODUCT`.
    @[JSON::Field(key: "DistanceFunction", converter: ADDB::VectorDistanceFunction)]
    property distance_function : VectorDistanceFunction

    def initialize(
      @index_name : String,
      @vector_attribute : VectorAttributeDefinition,
      @projection : Projection,
      @dimensions : Int64,
      @distance_function : VectorDistanceFunction,
      @search_schema : Array(SearchSchemaElement) | Nil = nil,
    )
    end

    def_equals_and_hash(@index_name, @vector_attribute, @search_schema, @projection, @dimensions, @distance_function)
  end
end
