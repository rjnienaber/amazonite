module Amazonite::DynamoDBV2
  # Represents a replica to be deleted.
  class DeleteReplicationGroupMemberAction
    include JSON::Serializable

    # The Region where the replica exists.
    @[JSON::Field(key: "RegionName")]
    property region_name : String

    def initialize(
      @region_name : String,
    )
    end

    def_equals_and_hash(@region_name)
  end
end
