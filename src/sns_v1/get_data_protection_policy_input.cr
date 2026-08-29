private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class GetDataProtectionPolicyInput
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
