private alias Core = Amazonite::Core

module Amazonite::IamV1
  class SetDefaultPolicyVersionRequest
    property policy_arn : String

    property version_id : String

    def initialize(
      @policy_arn : String,
      @version_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyArn", @policy_arn}

      params << {"#{prefix}VersionId", @version_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")).not_nil!,
        version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionId']")).not_nil!,
      )
    end
  end
end
