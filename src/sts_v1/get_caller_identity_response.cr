private alias Core = Amazonite::Core

module Amazonite::StsV1
  class GetCallerIdentityResponse
    property user_id : String | Nil

    property account : String | Nil

    property arn : String | Nil

    def initialize(
      @user_id : String | Nil = nil,
      @account : String | Nil = nil,
      @arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_id
        params << {"#{prefix}UserId", value}
      end

      if value = @account
        params << {"#{prefix}Account", value}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UserId']")),
        account: Core::XMLValue.string(node.xpath_node("*[local-name()='Account']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
      )
    end
  end
end
