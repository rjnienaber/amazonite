module Amazonite::DynamoDBV2
  class DeleteGlobalTableWitnessGroupMemberAction
    include JSON::Serializable

    @[JSON::Field(key: "RegionName")]
    property region_name : String

    def initialize(
      @region_name : String,
    )
    end
  end
end
