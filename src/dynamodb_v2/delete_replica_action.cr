module Amazonite::DynamoDBV2
  # Represents a replica to be removed.
  class DeleteReplicaAction
    include JSON::Serializable

    # The Region of the replica to be removed.
    @[JSON::Field(key: "RegionName")]
    property region_name : String

    def initialize(
      @region_name : String,
    )
    end

    def_equals_and_hash(@region_name)
  end
end
