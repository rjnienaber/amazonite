module Amazonite::SsmV1
  # Reserved for internal use.
  class RegistrationMetadataItem
    include JSON::Serializable

    # Reserved for internal use.
    @[JSON::Field(key: "Key")]
    property key : String

    # Reserved for internal use.
    @[JSON::Field(key: "Value")]
    property value : String

    def initialize(
      @key : String,
      @value : String,
    )
    end
  end
end
