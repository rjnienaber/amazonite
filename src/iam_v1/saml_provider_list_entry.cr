private alias Core = Amazonite::Core

module Amazonite::IamV1
  class SAMLProviderListEntry
    property arn : String | Nil

    property valid_until : Time | Nil

    property create_date : Time | Nil

    def initialize(
      @arn : String | Nil = nil,
      @valid_until : Time | Nil = nil,
      @create_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @valid_until
        params << {"#{prefix}ValidUntil", Core::QueryValue.time(value)}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        valid_until: Core::XMLValue.time(node.xpath_node("*[local-name()='ValidUntil']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
      )
    end
  end
end
