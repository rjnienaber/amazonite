private alias Core = Amazonite::Core

module Amazonite::Lambda
  # List of signing profiles that can sign a code package.
  class AllowedPublishers
    include JSON::Serializable

    # The Amazon Resource Name (ARN) for each of the signing profiles. A signing profile defines a
    # trusted user who can sign a code package.
    @[JSON::Field(key: "SigningProfileVersionArns")]
    property signing_profile_version_arns : Array(String) = [] of String

    def initialize(
      @signing_profile_version_arns : Array(String),
    )
    end

    def validate! : Nil
      if value = @signing_profile_version_arns
        raise Core::ValidationError.new("SigningProfileVersionArns must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("SigningProfileVersionArns must have at most 20 item(s)") if value.size > 20
      end
    end

    def_equals_and_hash(@signing_profile_version_arns)
  end
end
