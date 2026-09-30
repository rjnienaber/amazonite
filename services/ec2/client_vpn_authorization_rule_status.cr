private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the state of an authorization rule.
  class ClientVpnAuthorizationRuleStatus
    # The state of the authorization rule.
    property code : ClientVpnAuthorizationRuleStatusCode | Nil

    # A message about the status of the authorization rule, if applicable.
    property message : String | Nil

    def initialize(
      @code : ClientVpnAuthorizationRuleStatusCode | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @code
        params << {"#{prefix}Code", value.to_json_object_key}
      end

      if value = @message
        params << {"#{prefix}Message", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        code: (n = node.xpath_node("*[local-name()='code']")) ? AEC::ClientVpnAuthorizationRuleStatusCode.from_json_object_key?(n.content) : nil,
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='message']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @message)
  end
end
