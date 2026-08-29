module Amazonite::SsmV1
  # The result body of the ResetServiceSetting API operation.
  class ResetServiceSettingResult
    include JSON::Serializable

    # The current, effective service setting after calling the ResetServiceSetting API operation.
    @[JSON::Field(key: "ServiceSetting")]
    property service_setting : ServiceSetting | Nil

    def initialize(
      @service_setting : ServiceSetting | Nil = nil,
    )
    end
  end
end
