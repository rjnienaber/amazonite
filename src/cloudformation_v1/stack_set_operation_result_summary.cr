private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackSetOperationResultSummary
    property account : String | Nil

    property region : String | Nil

    property status : StackSetOperationResultStatus | Nil

    property status_reason : String | Nil

    property account_gate_result : AccountGateResult | Nil

    property organizational_unit_id : String | Nil

    def initialize(
      @account : String | Nil = nil,
      @region : String | Nil = nil,
      @status : StackSetOperationResultStatus | Nil = nil,
      @status_reason : String | Nil = nil,
      @account_gate_result : AccountGateResult | Nil = nil,
      @organizational_unit_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @account
        params << {"#{prefix}Account", value}
      end

      if value = @region
        params << {"#{prefix}Region", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_reason
        params << {"#{prefix}StatusReason", value}
      end

      if value = @account_gate_result
        params.concat(value.to_query_params("#{prefix}AccountGateResult."))
      end

      if value = @organizational_unit_id
        params << {"#{prefix}OrganizationalUnitId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        account: Core::XMLValue.string(node.xpath_node("*[local-name()='Account']")),
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='Region']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::StackSetOperationResultStatus.from_json_object_key?(n.content) : nil,
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
        account_gate_result: node.xpath_node("*[local-name()='AccountGateResult']").try { |n| AccountGateResult.from_xml(n) },
        organizational_unit_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OrganizationalUnitId']")),
      )
    end
  end
end
