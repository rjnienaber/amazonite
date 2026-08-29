private alias Core = Amazonite::Core

module Amazonite::IamV1
  class AttachedPolicy
    property policy_name : String | Nil

    property policy_arn : String | Nil

    def initialize(
      @policy_name : String | Nil = nil,
      @policy_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy_name
        params << {"#{prefix}PolicyName", value}
      end

      if value = @policy_arn
        params << {"#{prefix}PolicyArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")),
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")),
      )
    end
  end
end
