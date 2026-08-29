private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  class GetDelegationRequestResponse
    property delegation_request : DelegationRequest | Nil

    property permission_check_status : PermissionCheckStatusType | Nil

    property permission_check_result : PermissionCheckResultType | Nil

    def initialize(
      @delegation_request : DelegationRequest | Nil = nil,
      @permission_check_status : PermissionCheckStatusType | Nil = nil,
      @permission_check_result : PermissionCheckResultType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @delegation_request
        params.concat(value.to_query_params("#{prefix}DelegationRequest."))
      end

      if value = @permission_check_status
        params << {"#{prefix}PermissionCheckStatus", value.to_json_object_key}
      end

      if value = @permission_check_result
        params << {"#{prefix}PermissionCheckResult", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        delegation_request: node.xpath_node("*[local-name()='DelegationRequest']").try { |n| DelegationRequest.from_xml(n) },
        permission_check_status: (n = node.xpath_node("*[local-name()='PermissionCheckStatus']")) ? AI::PermissionCheckStatusType.from_json_object_key?(n.content) : nil,
        permission_check_result: (n = node.xpath_node("*[local-name()='PermissionCheckResult']")) ? AI::PermissionCheckResultType.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
