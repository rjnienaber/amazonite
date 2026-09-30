private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the list of SAML providers for this account.
  class SAMLProviderListEntry
    # The Amazon Resource Name (ARN) of the SAML provider.
    property arn : String | Nil

    # The expiration date and time for the SAML provider.
    property valid_until : Time | Nil

    # The date and time when the SAML provider was created.
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

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@arn, @valid_until, @create_date)
  end
end
