module Amazonite::SsmV1
  class ResetServiceSettingRequest
    include JSON::Serializable

    @[JSON::Field(key: "SettingId")]
    property setting_id : String

    def initialize(
      @setting_id : String
    )
    end
  end
end
