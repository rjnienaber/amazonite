private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class VectorIndex
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String

    @[JSON::Field(key: "VectorAttribute")]
    property vector_attribute : VectorAttributeDefinition

    @[JSON::Field(key: "SearchSchema")]
    property search_schema : Array(SearchSchemaElement) | Nil

    @[JSON::Field(key: "Projection")]
    property projection : Projection

    @[JSON::Field(key: "Dimensions")]
    property dimensions : Int64

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
