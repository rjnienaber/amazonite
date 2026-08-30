private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @index_name
        raise Core::ValidationError.new("IndexName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("IndexName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("IndexName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @vector_attribute
        value.validate!
      end

      if value = @search_schema
        raise Core::ValidationError.new("SearchSchema must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end

      if value = @projection
        value.validate!
      end

      if value = @dimensions
        raise Core::ValidationError.new("Dimensions value must be >= 1") if value < 1
      end
    end

    def_equals_and_hash(@index_name, @vector_attribute, @search_schema, @projection, @dimensions, @distance_function)
  end
end
