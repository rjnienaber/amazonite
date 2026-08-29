module Amazonite::DynamoDBV2
  class GlobalTableWitnessGroupUpdate
    include JSON::Serializable

    @[JSON::Field(key: "Create")]
    property create : CreateGlobalTableWitnessGroupMemberAction | Nil

    @[JSON::Field(key: "Delete")]
    property delete : DeleteGlobalTableWitnessGroupMemberAction | Nil

    def initialize(
      @create : CreateGlobalTableWitnessGroupMemberAction | Nil = nil,
      @delete : DeleteGlobalTableWitnessGroupMemberAction | Nil = nil,
    )
    end
  end
end
