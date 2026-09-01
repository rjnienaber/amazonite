private alias Core = Amazonite::Core

module Amazonite::Ssm
  # The service setting data structure.
  #
  # `ServiceSetting` is an account-level setting for an Amazon Web Services service. This setting
  # defines how a user interacts with or uses a service or a feature of a service. For example, if
  # an Amazon Web Services service charges money to the account based on feature or service usage,
  # then the Amazon Web Services service team might create a default setting of "false". This means
  # the user can't use this feature unless they change the setting to "true" and intentionally opt
  # in for a paid feature.
  #
  # Services map a `SettingId` object to a setting value. Amazon Web Services services teams define
  # the default value for a `SettingId`. You can't create a new `SettingId`, but you can overwrite
  # the default value if you have the `ssm:UpdateServiceSetting` permission for the setting. Use the
  # UpdateServiceSetting API operation to change the default setting. Or, use the
  # ResetServiceSetting to change the value back to the original value defined by the Amazon Web
  # Services service team.
  class ServiceSetting
    include JSON::Serializable

    # The ID of the service setting.
    @[JSON::Field(key: "SettingId")]
    property setting_id : String | Nil

    # The value of the service setting.
    @[JSON::Field(key: "SettingValue")]
    property setting_value : String | Nil

    # The last time the service setting was modified.
    @[JSON::Field(key: "LastModifiedDate", converter: Core::AWSEpochConverter)]
    property last_modified_date : Time | Nil

    # The ARN of the last modified user. This field is populated only if the setting value was
    # overwritten.
    @[JSON::Field(key: "LastModifiedUser")]
    property last_modified_user : String | Nil

    # The ARN of the service setting.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The status of the service setting. The value can be Default, Customized or PendingUpdate.
    #
    # - Default: The current setting uses a default value provisioned by the Amazon Web Services
    # service team.
    #
    # - Customized: The current setting use a custom value specified by the customer.
    #
    # - PendingUpdate: The current setting uses a default or custom value, but a setting change
    # request is pending approval.
    @[JSON::Field(key: "Status")]
    property status : String | Nil

    def initialize(
      @setting_id : String | Nil = nil,
      @setting_value : String | Nil = nil,
      @last_modified_date : Time | Nil = nil,
      @last_modified_user : String | Nil = nil,
      @arn : String | Nil = nil,
      @status : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @setting_id
        raise Core::ValidationError.new("SettingId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SettingId length must be <= 1000") if value.size > 1000
      end

      if value = @setting_value
        raise Core::ValidationError.new("SettingValue length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SettingValue length must be <= 4096") if value.size > 4096
      end
    end

    def_equals_and_hash(@setting_id, @setting_value, @last_modified_date, @last_modified_user, @arn, @status)
  end
end
