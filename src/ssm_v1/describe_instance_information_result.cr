module Amazonite::SsmV1
  class DescribeInstanceInformationResult
    include JSON::Serializable

    @[JSON::Field(key: "InstanceInformationList")]
    property instance_information_list : Array(InstanceInformation) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @instance_information_list : Array(InstanceInformation) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
