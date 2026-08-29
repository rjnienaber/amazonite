private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetDelegationRequestRequest
    property delegation_request_id : String

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
  end
end
