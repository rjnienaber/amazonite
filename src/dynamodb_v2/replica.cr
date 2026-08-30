module Amazonite::DynamoDBV2
  # Represents the properties of a replica.
  class Replica
    include JSON::Serializable

    # The Region where the replica needs to be created.
    @[JSON::Field(key: "RegionName")]
    property region_name : String | Nil

    def initialize(
      @region_name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@region_name)
  end
end
