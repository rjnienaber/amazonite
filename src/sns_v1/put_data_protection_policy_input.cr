private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class PutDataProtectionPolicyInput
    property resource_arn : String

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
  end
end
