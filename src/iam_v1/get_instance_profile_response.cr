module Amazonite::IamV1
  # Contains the response to a successful
  # [GetInstanceProfile](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetInstanceProfile.html)
  # request.
  class GetInstanceProfileResponse
    # A structure containing details about the instance profile.
    property instance_profile : InstanceProfile

    def initialize(
      @instance_profile : InstanceProfile,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@instance_profile.to_query_params("#{prefix}InstanceProfile."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_profile: node.xpath_node("*[local-name()='InstanceProfile']").try { |n| InstanceProfile.from_xml(n) }.not_nil!,
      )
    end
  end
end
