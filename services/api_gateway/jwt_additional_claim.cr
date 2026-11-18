private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  # An additional claim rule for an issuer.
  class JwtAdditionalClaim
    include JSON::Serializable

    # The name of the claim to check. The value cannot be empty and cannot be `iss`, `aud`, `exp`,
    # `nbf`, `iat`, `scope`, or `scp`.
    @[JSON::Field(key: "claimName")]
    property claim_name : String

    # The format of the claim value. The only valid value is `SINGLE_STRING`.
    @[JSON::Field(key: "format", converter: AAG::JwtClaimFormat)]
    property format : JwtClaimFormat

    # Specifies whether the claim must be present in the token. Defaults to `false`. When `true`, the
    # token must contain the claim.
    @[JSON::Field(key: "required")]
    property required : Bool | Nil

    # The accepted value for the claim. The value cannot be empty. When a value is specified, the
    # claim must match it exactly, and the match is case-sensitive. When no value is specified, the
    # claim only has to be present.
    @[JSON::Field(key: "expectedValues")]
    property expected_values : Array(String) | Nil

    def initialize(
      @claim_name : String,
      @format : JwtClaimFormat,
      @required : Bool | Nil = nil,
      @expected_values : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@claim_name, @format, @required, @expected_values)
  end
end
