private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcEndpointConnectionNotificationRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the notification.
    property connection_notification_id : String

    # The ARN for the SNS topic for the notification.
    property connection_notification_arn : String | Nil

    # The events for the endpoint. Valid values are `Accept`, `Connect`, `Delete`, and `Reject`.
    property connection_events : Array(String) | Nil

    def initialize(
      @connection_notification_id : String,
      @dry_run : Bool | Nil = nil,
      @connection_notification_arn : String | Nil = nil,
      @connection_events : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}ConnectionNotificationId", @connection_notification_id}

      if value = @connection_notification_arn
        params << {"#{prefix}ConnectionNotificationArn", value}
      end

      (@connection_events || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ConnectionEvents.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        connection_notification_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ConnectionNotificationId']")).not_nil!,
        connection_notification_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ConnectionNotificationArn']")),
        connection_events: node.xpath_nodes("*[local-name()='ConnectionEvents']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @connection_notification_id, @connection_notification_arn, @connection_events)
  end
end
