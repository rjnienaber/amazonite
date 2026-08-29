module Amazonite::DynamoDBV2
  # Represents a replica to be added.
  class CreateReplicaAction
    include JSON::Serializable

    # The Region of the replica to be added.
    @[JSON::Field(key: "RegionName")]
    property region_name : String

    def initialize(
      @region_name : String,
    )
    end
  end
end
