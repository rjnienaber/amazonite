module Amazonite::LambdaV1
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
  end
end
