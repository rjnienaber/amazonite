module Amazonite::SsmV1
  # The request body of the GetServiceSetting API operation.
  class GetServiceSettingRequest
    include JSON::Serializable

    # The ID of the service setting to get. The setting ID can be one of the following.
    #
    # - `/ssm/appmanager/appmanager-enabled`
    #
    # - `/ssm/automation/customer-script-log-destination`
    #
    # - `/ssm/automation/customer-script-log-group-name`
    #
    # - /ssm/automation/enable-adaptive-concurrency
    #
    # - `/ssm/documents/console/public-sharing-permission`
    #
    # - `/ssm/managed-instance/activation-tier`
    #
    # - `/ssm/managed-instance/default-ec2-instance-management-role`
    #
    # - `/ssm/opsinsights/opscenter`
    #
    # - `/ssm/parameter-store/default-parameter-tier`
    #
    # - `/ssm/parameter-store/high-throughput-enabled`
    @[JSON::Field(key: "SettingId")]
    property setting_id : String

    def initialize(
      @setting_id : String,
    )
    end

    def_equals_and_hash(@setting_id)
  end
end
