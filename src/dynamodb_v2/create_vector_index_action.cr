private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # A new vector index to be added to a table.
  class CreateVectorIndexAction
    include JSON::Serializable

    # The name of the vector index. Must be unique within the table.
    @[JSON::Field(key: "IndexName")]
    property index_name : String

    # The attribute that contains vector embeddings. If multiple vector indexes reference the same
    # attribute, they must all use the same number of dimensions.
    @[JSON::Field(key: "VectorAttribute")]
    property vector_attribute : VectorAttributeDefinition

    # The partition key and inline filter attribute definitions for the vector index.
    @[JSON::Field(key: "SearchSchema")]
    property search_schema : Array(SearchSchemaElement) | Nil

    # Specifies attributes that are copied (projected) from the table into the vector index.
    @[JSON::Field(key: "Projection")]
    property projection : Projection

    # The number of dimensions in each vector.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Int64

    # The distance function used to calculate similarity. Valid values: `COSINE`, `EUCLIDEAN`,
    # `DOT_PRODUCT`.
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
  end
end
