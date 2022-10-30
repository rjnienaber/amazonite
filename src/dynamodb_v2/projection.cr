private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class Projection
    include JSON::Serializable

    @[JSON::Field(key: "ProjectionType", converter: ADDB::ProjectionType)]
    property projection_type : ProjectionType | Nil

    @[JSON::Field(key: "NonKeyAttributes")]
    property non_key_attributes : Array(String) | Nil

    def initialize(
      @projection_type : ProjectionType | Nil = nil,
      @non_key_attributes : Array(String) | Nil = nil
    )
    end
  end
end
