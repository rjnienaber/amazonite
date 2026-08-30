private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetDelegationRequestRequest
    # The unique identifier of the delegation request to retrieve.
    property delegation_request_id : String

    # Specifies whether to perform a permission check for the delegation request.
    #
    # If set to true, the `GetDelegationRequest` API call will start a permission check process. This
    # process calculates whether the caller has sufficient permissions to cover the asks from this
    # delegation request.
    #
    # Setting this parameter to true does not guarantee an answer in the response. See the
    # `PermissionCheckStatus` and the `PermissionCheckResult` response attributes for further details.
    property delegation_permission_check : Bool | Nil

    def initialize(
      @delegation_request_id : String,
      @delegation_permission_check : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}DelegationRequestId", @delegation_request_id}

      if value = @delegation_permission_check
        params << {"#{prefix}DelegationPermissionCheck", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        delegation_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DelegationRequestId']")).not_nil!,
        delegation_permission_check: Core::XMLValue.bool(node.xpath_node("*[local-name()='DelegationPermissionCheck']")),
      )
    end

    def validate! : Nil
      if value = @delegation_request_id
        raise Core::ValidationError.new("DelegationRequestId length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("DelegationRequestId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("DelegationRequestId does not match the required pattern") unless value.matches?(Regex.new("^[\\w-]+$"))
      end
    end

    def_equals_and_hash(@delegation_request_id, @delegation_permission_check)
  end
end
