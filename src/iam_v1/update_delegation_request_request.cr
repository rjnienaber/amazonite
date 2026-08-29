private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateDelegationRequestRequest
    # The unique identifier of the delegation request to update.
    property delegation_request_id : String

    # Additional notes or comments to add to the delegation request.
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
  end
end
