private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateDelegationRequestResponse
    # A deep link URL to the Amazon Web Services Management Console for managing the delegation
    # request.
    #
    # For a console based workflow, partners should redirect the customer to this URL. If the customer
    # is not logged in to any Amazon Web Services account, the Amazon Web Services workflow will
    # automatically direct the customer to log in and then display the delegation request approval
    # page.
    property console_deep_link : String | Nil

    # The unique identifier for the created delegation request.
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

    def_equals_and_hash(@console_deep_link, @delegation_request_id)
  end
end
