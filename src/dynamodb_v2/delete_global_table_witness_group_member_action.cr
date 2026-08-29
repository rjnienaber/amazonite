module Amazonite::DynamoDBV2
  # Specifies the action to remove a witness Region from a MRSC global table. You cannot delete a
  # single witness from a MRSC global table - you must delete both a replica and the witness
  # together. The deletion of both a witness and replica converts the remaining replica to a
  # single-Region DynamoDB table.
  class DeleteGlobalTableWitnessGroupMemberAction
    include JSON::Serializable

    # The witness Region name to be removed from the MRSC global table.
    @[JSON::Field(key: "RegionName")]
    property region_name : String

    def initialize(
      @region_name : String,
    )
    end
  end
end
