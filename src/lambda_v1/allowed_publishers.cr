module Amazonite::LambdaV1
  class AllowedPublishers
    include JSON::Serializable

    @[JSON::Field(key: "SigningProfileVersionArns")]
    property signing_profile_version_arns : Array(String) = [] of String

    def initialize(
      @signing_profile_version_arns : Array(String),
    )
    end
  end
end
