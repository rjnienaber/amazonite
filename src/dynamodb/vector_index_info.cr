private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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
