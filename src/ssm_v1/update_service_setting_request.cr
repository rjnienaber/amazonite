module Amazonite::SsmV1
  class UpdateServiceSettingRequest
    include JSON::Serializable

    @[JSON::Field(key: "SettingId")]
    property setting_id : String

    @[JSON::Field(key: "SettingValue")]
    property setting_value : String

    def initialize(
      @setting_id : String,
      @setting_value : String
    )
    end
  end
end
