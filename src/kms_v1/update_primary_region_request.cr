module Amazonite::KmsV1
  class UpdatePrimaryRegionRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "PrimaryRegion")]
    property primary_region : String

    def initialize(
      @key_id : String,
      @primary_region : String,
    )
    end
  end
end
