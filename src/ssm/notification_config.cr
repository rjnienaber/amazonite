private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Configurations for sending notifications.
  class NotificationConfig
    include JSON::Serializable

    # An Amazon Resource Name (ARN) for an Amazon Simple Notification Service (Amazon SNS) topic. Run
    # Command pushes notifications about command status changes to this topic.
    @[JSON::Field(key: "NotificationArn")]
    property notification_arn : String | Nil

    # The different events for which you can receive notifications. To learn more about these events,
    # see [Monitoring Systems Manager status changes using Amazon SNS
    # notifications](https://docs.aws.amazon.com/systems-manager/latest/userguide/monitoring-sns-notifications.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "NotificationEvents", converter: Core::ArrayConverter(AS::NotificationEvent))]
    property notification_events : Array(NotificationEvent) | Nil

    # The type of notification.
    #
    # - `Command`: Receive notification when the status of a command changes.
    #
    # - `Invocation`: For commands sent to multiple managed nodes, receive notification on a per-node
    # basis when the status of a command changes.
    @[JSON::Field(key: "NotificationType", converter: AS::NotificationType)]
    property notification_type : NotificationType | Nil

    def initialize(
      @notification_arn : String | Nil = nil,
      @notification_events : Array(NotificationEvent) | Nil = nil,
      @notification_type : NotificationType | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@notification_arn, @notification_events, @notification_type)
  end
end
