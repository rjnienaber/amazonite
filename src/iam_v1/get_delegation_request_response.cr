private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  class GetDelegationRequestResponse
    # The delegation request object containing all details about the request.
    property delegation_request : DelegationRequest | Nil

    # The status of the permission check for the delegation request.
    #
    # This value indicates the status of the process to check whether the caller has sufficient
    # permissions to cover the requested actions in the delegation request. Since this is an
    # asynchronous process, there are three potential values:
    #
    # - `IN_PROGRESS` : The permission check process has started.
    #
    # - `COMPLETED` : The permission check process has completed. The `PermissionCheckResult` will
    # include the result.
    #
    # - `FAILED` : The permission check process has failed.
    property permission_check_status : PermissionCheckStatusType | Nil

    # The result of the permission check, indicating whether the caller has sufficient permissions to
    # cover the requested permissions. This is an approximate result.
    #
    # - `ALLOWED` : The caller has sufficient permissions cover all the requested permissions.
    #
    # - `DENIED` : The caller does not have sufficient permissions to cover all the requested
    # permissions.
    #
    # - `UNSURE` : It is not possible to determine whether the caller has all the permissions needed.
    # This output is most likely for cases when the caller has permissions with conditions.
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
