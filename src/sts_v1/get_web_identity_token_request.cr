private alias Core = Amazonite::Core

module Amazonite::StsV1
  class GetWebIdentityTokenRequest
    # The intended recipient of the web identity token. This value populates the `aud` claim in the
    # JWT and should identify the service or application that will validate and use the token. The
    # external service should verify this claim to ensure the token was intended for their use.
    property audience : Array(String) = [] of String

    # The duration, in seconds, for which the JSON Web Token (JWT) will remain valid. The value can
    # range from 60 seconds (1 minute) to 3600 seconds (1 hour). If not specified, the default
    # duration is 300 seconds (5 minutes). The token is designed to be short-lived and should be used
    # for proof of identity, then exchanged for credentials or short-lived tokens in the external
    # service.
    property duration_seconds : Int32 | Nil

    # The cryptographic algorithm to use for signing the JSON Web Token (JWT). Valid values are RS256
    # (RSA with SHA-256) and ES384 (ECDSA using P-384 curve with SHA-384).
    property signing_algorithm : String

    # An optional list of tags to include in the JSON Web Token (JWT). These tags are added as custom
    # claims to the JWT and can be used by the downstream service for authorization decisions.
    property tags : Array(Tag) | Nil

    def initialize(
      @audience : Array(String),
      @signing_algorithm : String,
      @duration_seconds : Int32 | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @audience.each_with_index(1) do |item, i|
        params << {"#{prefix}Audience.member.#{i}", item}
      end

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end

      params << {"#{prefix}SigningAlgorithm", @signing_algorithm}

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        audience: node.xpath_nodes("*[local-name()='Audience']/*[local-name()='member']").map { |n| n.content },
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
        signing_algorithm: Core::XMLValue.string(node.xpath_node("*[local-name()='SigningAlgorithm']")).not_nil!,
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
