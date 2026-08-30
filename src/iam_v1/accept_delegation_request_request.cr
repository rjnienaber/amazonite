private alias Core = Amazonite::Core

module Amazonite::IamV1
  class AcceptDelegationRequestRequest
    # The unique identifier of the delegation request to accept.
    property delegation_request_id : String

    def initialize(
      @delegation_request_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}DelegationRequestId", @delegation_request_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        delegation_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DelegationRequestId']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @delegation_request_id
        raise Core::ValidationError.new("DelegationRequestId length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("DelegationRequestId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("DelegationRequestId does not match the required pattern") unless value.matches?(Regex.new("^[\\w-]+$"))
      end
    end

    def_equals_and_hash(@delegation_request_id)
  end
end
