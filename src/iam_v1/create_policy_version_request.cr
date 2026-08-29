private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreatePolicyVersionRequest
    property policy_arn : String

    property policy_document : String

    property set_as_default : Bool | Nil

    def initialize(
      @policy_arn : String,
      @policy_document : String,
      @set_as_default : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyArn", @policy_arn}

      params << {"#{prefix}PolicyDocument", @policy_document}

      if value = @set_as_default
        params << {"#{prefix}SetAsDefault", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")).not_nil!,
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyDocument']")).not_nil!,
        set_as_default: Core::XMLValue.bool(node.xpath_node("*[local-name()='SetAsDefault']")),
      )
    end
  end
end
