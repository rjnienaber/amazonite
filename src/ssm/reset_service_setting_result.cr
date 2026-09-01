private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @service_setting
        value.validate!
      end
    end

    def_equals_and_hash(@service_setting)
  end
end
