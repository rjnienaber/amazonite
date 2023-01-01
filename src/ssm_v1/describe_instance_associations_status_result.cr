module Amazonite::SsmV1
  class DescribeInstanceAssociationsStatusResult
    include JSON::Serializable

    @[JSON::Field(key: "InstanceAssociationStatusInfos")]
    property instance_association_status_infos : Array(InstanceAssociationStatusInfo) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @instance_association_status_infos : Array(InstanceAssociationStatusInfo) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
