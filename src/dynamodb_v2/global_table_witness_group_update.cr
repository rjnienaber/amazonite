module Amazonite::DynamoDBV2
  # Represents one of the following:
  #
  # - A new witness to be added to a new global table.
  #
  # - An existing witness to be removed from an existing global table.
  #
  # You can configure one witness per MRSC global table.
  class GlobalTableWitnessGroupUpdate
    include JSON::Serializable

    # Specifies a witness Region to be added to a new MRSC global table. The witness must be added
    # when creating the MRSC global table.
    @[JSON::Field(key: "Create")]
    property create : CreateGlobalTableWitnessGroupMemberAction | Nil

    # Specifies a witness Region to be removed from an existing global table. Must be done in
    # conjunction with removing a replica. The deletion of both a witness and replica converts the
    # remaining replica to a single-Region DynamoDB table.
    @[JSON::Field(key: "Delete")]
    property delete : DeleteGlobalTableWitnessGroupMemberAction | Nil

    def initialize(
      @create : CreateGlobalTableWitnessGroupMemberAction | Nil = nil,
      @delete : DeleteGlobalTableWitnessGroupMemberAction | Nil = nil,
    )
    end
  end
end
