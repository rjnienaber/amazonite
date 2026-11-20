private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the key hashes that are associated with a SAML identity provider issuer.
  #
  # This data type is used as a response element in the
  # [GetSAMLProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetSAMLProvider.html)
  # operation.
  class SAMLKeyHashEntry
    # The issuer URL of the SAML identity provider that the key hashes are associated with.
    property issuer_url : String | Nil

    # The list of key hashes for the SAML identity provider issuer.
    property key_hashes : Array(String) | Nil

    def initialize(
      @issuer_url : String | Nil = nil,
      @key_hashes : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @issuer_url
        params << {"#{prefix}IssuerURL", value}
      end

      (@key_hashes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}KeyHashes.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        issuer_url: Core::XMLValue.string(node.xpath_node("*[local-name()='IssuerURL']")),
        key_hashes: node.xpath_nodes("*[local-name()='KeyHashes']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @issuer_url
        raise Core::ValidationError.new("IssuerURL length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IssuerURL length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@issuer_url, @key_hashes)
  end
end
