module Amazonite::SsmV1
  class GetServiceSettingResult
    include JSON::Serializable

    @[JSON::Field(key: "ServiceSetting")]
    property service_setting : ServiceSetting | Nil

    def initialize(
      @service_setting : ServiceSetting | Nil = nil
    )
    end
  end
end
