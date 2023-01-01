module Amazonite::SsmV1
  class RegistrationMetadataItem
    include JSON::Serializable

    @[JSON::Field(key: "Key")]
    property key : String

    @[JSON::Field(key: "Value")]
    property value : String

    def initialize(
      @key : String,
      @value : String
    )
    end
  end
end
