private alias Core = Amazonite::Core

module Amazonite::Sts
  class GetDelegatedAccessTokenRequest
    # The token to exchange for temporary Amazon Web Services credentials. This token must be valid
    # and unexpired at the time of the request.
    property trade_in_token : String

    def initialize(
      @trade_in_token : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TradeInToken", @trade_in_token}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        trade_in_token: Core::XMLValue.string(node.xpath_node("*[local-name()='TradeInToken']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@trade_in_token)
  end
end
