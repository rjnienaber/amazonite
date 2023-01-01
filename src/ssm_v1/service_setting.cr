private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class ServiceSetting
    include JSON::Serializable

    @[JSON::Field(key: "SettingId")]
    property setting_id : String | Nil

    @[JSON::Field(key: "SettingValue")]
    property setting_value : String | Nil

    @[JSON::Field(key: "LastModifiedDate", converter: Core::AWSEpochConverter)]
    property last_modified_date : Time | Nil

    @[JSON::Field(key: "LastModifiedUser")]
    property last_modified_user : String | Nil

    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    @[JSON::Field(key: "Status")]
    property status : String | Nil

    def initialize(
      @setting_id : String | Nil = nil,
      @setting_value : String | Nil = nil,
      @last_modified_date : Time | Nil = nil,
      @last_modified_user : String | Nil = nil,
      @arn : String | Nil = nil,
      @status : String | Nil = nil
    )
    end
  end
end
