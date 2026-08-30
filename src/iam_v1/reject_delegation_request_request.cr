private alias Core = Amazonite::Core

module Amazonite::IamV1
  class RejectDelegationRequestRequest
    # The unique identifier of the delegation request to reject.
    property delegation_request_id : String

    # Optional notes explaining the reason for rejecting the delegation request.
    property notes : String | Nil

    def initialize(
      @delegation_request_id : String,
      @notes : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}DelegationRequestId", @delegation_request_id}

      if value = @notes
        params << {"#{prefix}Notes", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        delegation_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DelegationRequestId']")).not_nil!,
        notes: Core::XMLValue.string(node.xpath_node("*[local-name()='Notes']")),
      )
    end

    def validate! : Nil
      if value = @delegation_request_id
        raise Core::ValidationError.new("DelegationRequestId length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("DelegationRequestId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("DelegationRequestId does not match the required pattern") unless value.matches?(Regex.new("^[\\w-]+$"))
      end

      if value = @notes
        raise Core::ValidationError.new("Notes length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Notes length must be <= 500") if value.size > 500
        raise Core::ValidationError.new("Notes does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~¡-ÿ]*$"))
      end
    end

    def_equals_and_hash(@delegation_request_id, @notes)
  end
end
