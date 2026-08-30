module Amazonite::SsmV1
  # The query result body of the GetServiceSetting API operation.
  class GetServiceSettingResult
    include JSON::Serializable

    # The query result of the current service setting.
    @[JSON::Field(key: "ServiceSetting")]
    property service_setting : ServiceSetting | Nil

    def initialize(
      @service_setting : ServiceSetting | Nil = nil,
    )
    end

    def_equals_and_hash(@service_setting)
  end
end
