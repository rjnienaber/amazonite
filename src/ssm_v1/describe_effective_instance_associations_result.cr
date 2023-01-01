module Amazonite::SsmV1
  class DescribeEffectiveInstanceAssociationsResult
    include JSON::Serializable

    @[JSON::Field(key: "Associations")]
    property associations : Array(InstanceAssociation) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @associations : Array(InstanceAssociation) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
