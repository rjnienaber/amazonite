module Amazonite::DynamoDBv2
  class DeleteReplicationGroupMemberAction
    include JSON::Serializable

    @[JSON::Field(key: "RegionName")]
    property region_name : String

    def initialize(
      @region_name : String
    )
    end
  end
end
