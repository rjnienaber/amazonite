private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class PutDataProtectionPolicyInput
    # The ARN of the topic whose `DataProtectionPolicy` you want to add or update.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # Amazon Web Services General Reference.
    property resource_arn : String

    # The JSON serialization of the topic's `DataProtectionPolicy`.
    #
    # The `DataProtectionPolicy` must be in JSON string format.
    #
    # Length Constraints: Maximum length of 30,720.
    property data_protection_policy : String

    def initialize(
      @resource_arn : String,
      @data_protection_policy : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ResourceArn", @resource_arn}

      params << {"#{prefix}DataProtectionPolicy", @data_protection_policy}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceArn']")).not_nil!,
        data_protection_policy: Core::XMLValue.string(node.xpath_node("*[local-name()='DataProtectionPolicy']")).not_nil!,
      )
    end

    def_equals_and_hash(@resource_arn, @data_protection_policy)
  end
end
