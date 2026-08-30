private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeInstanceInformationResult
    include JSON::Serializable

    # The managed node information list.
    @[JSON::Field(key: "InstanceInformationList")]
    property instance_information_list : Array(InstanceInformation) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @instance_information_list : Array(InstanceInformation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @instance_information_list
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_information_list, @next_token)
  end
end
