private alias Core = Amazonite::Core

module Amazonite::StsV1
  class GetAccessKeyInfoResponse
    # The number used to identify the Amazon Web Services account.
    property account : String | Nil

    def initialize(
      @account : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @account
        params << {"#{prefix}Account", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        account: Core::XMLValue.string(node.xpath_node("*[local-name()='Account']")),
      )
    end

    def_equals_and_hash(@account)
  end
end
