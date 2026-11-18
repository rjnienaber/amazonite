private alias AAG = Amazonite::ApiGateway
private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # The JWT configuration supplied for a JWT authorizer.
  class JwtConfigurationInput
    include JSON::Serializable

    # The issuers that the authorizer trusts. Issuer URLs must be unique.
    @[JSON::Field(key: "issuers")]
    property issuers : Array(JwtIssuerInput) = [] of JwtIssuerInput

    # The signing algorithms that the authorizer accepts, applied to every issuer. Valid values are
    # `RS256`, `RS384`, `RS512`, `ES256`, `ES384`, and `ES512`.
    @[JSON::Field(key: "defaultAlgorithms", converter: Core::ArrayConverter(AAG::JwtSigningAlgorithm))]
    property default_algorithms : Array(JwtSigningAlgorithm) = [] of JwtSigningAlgorithm

    def initialize(
      @issuers : Array(JwtIssuerInput),
      @default_algorithms : Array(JwtSigningAlgorithm),
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
