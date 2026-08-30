module Amazonite::SsmV1
  class DescribeEffectiveInstanceAssociationsResult
    include JSON::Serializable

    # The associations for the requested managed node.
    @[JSON::Field(key: "Associations")]
    property associations : Array(InstanceAssociation) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @associations : Array(InstanceAssociation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
