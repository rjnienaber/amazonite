module Amazonite::SsmV1
  # The request body of the UpdateServiceSetting API operation.
  class UpdateServiceSettingRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the service setting to update. For example,
    # `arn:aws:ssm:us-east-1:111122223333:servicesetting/ssm/parameter-store/high-throughput-enabled`.
    # The setting ID can be one of the following.
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
    #
    # Permissions to update the `/ssm/managed-instance/default-ec2-instance-management-role` setting
    # should only be provided to administrators. Implement least privilege access when allowing
    # individuals to configure or modify the Default Host Management Configuration.
    @[JSON::Field(key: "SettingId")]
    property setting_id : String

    # The new value to specify for the service setting. The following list specifies the available
    # values for each setting.
    #
    # - For `/ssm/appmanager/appmanager-enabled`, enter `True` or `False`.
    #
    # - For `/ssm/automation/customer-script-log-destination`, enter `CloudWatch`.
    #
    # - For `/ssm/automation/customer-script-log-group-name`, enter the name of an Amazon CloudWatch
    # Logs log group.
    #
    # - For `/ssm/documents/console/public-sharing-permission`, enter `Enable` or `Disable`.
    #
    # - For `/ssm/managed-instance/activation-tier`, enter `standard` or `advanced`.
    #
    # - For `/ssm/managed-instance/default-ec2-instance-management-role`, enter the name of an IAM
    # role.
    #
    # - For `/ssm/opsinsights/opscenter`, enter `Enabled` or `Disabled`.
    #
    # - For `/ssm/parameter-store/default-parameter-tier`, enter `Standard`, `Advanced`, or
    # `Intelligent-Tiering`
    #
    # - For `/ssm/parameter-store/high-throughput-enabled`, enter `true` or `false`.
    @[JSON::Field(key: "SettingValue")]
    property setting_value : String

    def initialize(
      @setting_id : String,
      @setting_value : String,
    )
    end

    def_equals_and_hash(@setting_id, @setting_value)
  end
end
