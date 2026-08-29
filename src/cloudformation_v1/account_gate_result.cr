private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class AccountGateResult
    property status : AccountGateStatus | Nil

    property status_reason : String | Nil

    def initialize(
      @status : AccountGateStatus | Nil = nil,
      @status_reason : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_reason
        params << {"#{prefix}StatusReason", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::AccountGateStatus.from_json_object_key?(n.content) : nil,
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
      )
    end
  end
end
