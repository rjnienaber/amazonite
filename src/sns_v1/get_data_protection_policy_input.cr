private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class GetDataProtectionPolicyInput
    # The ARN of the topic whose `DataProtectionPolicy` you want to get.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # Amazon Web Services General Reference.
    property resource_arn : String

    def initialize(
      @resource_arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ResourceArn", @resource_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceArn']")).not_nil!,
      )
    end
  end
end
