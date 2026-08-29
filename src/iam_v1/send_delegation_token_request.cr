private alias Core = Amazonite::Core

module Amazonite::IamV1
  class SendDelegationTokenRequest
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
  end
end
