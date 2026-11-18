private alias AAG = Amazonite::ApiGateway
private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # The JWT configuration returned for a JWT authorizer.
  class JwtConfiguration
    include JSON::Serializable

    # The trusted issuers configured for the authorizer.
    @[JSON::Field(key: "issuers")]
    property issuers : Array(JwtIssuer) | Nil

    # The signing algorithms configured for the authorizer.
    @[JSON::Field(key: "defaultAlgorithms", converter: Core::ArrayConverter(AAG::JwtSigningAlgorithm))]
    property default_algorithms : Array(JwtSigningAlgorithm) | Nil

    def initialize(
      @issuers : Array(JwtIssuer) | Nil = nil,
      @default_algorithms : Array(JwtSigningAlgorithm) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @issuers
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@issuers, @default_algorithms)
  end
end
