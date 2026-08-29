module Amazonite::SsmV1
  class DescribeInstanceAssociationsStatusResult
    include JSON::Serializable

    # Status information about the association.
    @[JSON::Field(key: "InstanceAssociationStatusInfos")]
    property instance_association_status_infos : Array(InstanceAssociationStatusInfo) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @instance_association_status_infos : Array(InstanceAssociationStatusInfo) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
