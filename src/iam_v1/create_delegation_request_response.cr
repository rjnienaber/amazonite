private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateDelegationRequestResponse
    property console_deep_link : String | Nil

    property delegation_request_id : String | Nil

    def initialize(
      @console_deep_link : String | Nil = nil,
      @delegation_request_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @console_deep_link
        params << {"#{prefix}ConsoleDeepLink", value}
      end

      if value = @delegation_request_id
        params << {"#{prefix}DelegationRequestId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        console_deep_link: Core::XMLValue.string(node.xpath_node("*[local-name()='ConsoleDeepLink']")),
        delegation_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DelegationRequestId']")),
      )
    end
  end
end
