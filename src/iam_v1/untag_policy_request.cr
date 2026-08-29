private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UntagPolicyRequest
    property policy_arn : String

    property tag_keys : Array(String) = [] of String

    def initialize(
      @policy_arn : String,
      @tag_keys : Array(String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyArn", @policy_arn}

      @tag_keys.each_with_index(1) do |item, i|
        params << {"#{prefix}TagKeys.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")).not_nil!,
        tag_keys: node.xpath_nodes("*[local-name()='TagKeys']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
