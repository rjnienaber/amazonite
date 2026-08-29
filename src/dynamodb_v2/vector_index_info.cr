private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class VectorIndexInfo
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "VectorAttribute")]
    property vector_attribute : VectorAttributeDefinition | Nil

    @[JSON::Field(key: "SearchSchema")]
    property search_schema : Array(SearchSchemaElement) | Nil

    @[JSON::Field(key: "Projection")]
    property projection : Projection | Nil

    @[JSON::Field(key: "Dimensions")]
    property dimensions : Int64 | Nil

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
