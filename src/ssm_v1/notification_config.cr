private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class NotificationConfig
    include JSON::Serializable

    @[JSON::Field(key: "NotificationArn")]
    property notification_arn : String | Nil

    @[JSON::Field(key: "NotificationEvents")]
    property notification_events : Array(NotificationEvent) | Nil

    @[JSON::Field(key: "NotificationType", converter: AS::NotificationType)]
    property notification_type : NotificationType | Nil

    def initialize(
      @notification_arn : String | Nil = nil,
      @notification_events : Array(NotificationEvent) | Nil = nil,
      @notification_type : NotificationType | Nil = nil
    )
    end
  end
end
