private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a connection notification for a VPC endpoint or VPC endpoint service.
  class ConnectionNotification
    # The ID of the notification.
    property connection_notification_id : String | Nil

    # The ID of the endpoint service.
    property service_id : String | Nil

    # The ID of the VPC endpoint.
    property vpc_endpoint_id : String | Nil

    # The type of notification.
    property connection_notification_type : ConnectionNotificationType | Nil

    # The ARN of the SNS topic for the notification.
    property connection_notification_arn : String | Nil

    # The events for the notification. Valid values are `Accept`, `Connect`, `Delete`, and `Reject`.
    property connection_events : Array(String) | Nil

    # The state of the notification.
    property connection_notification_state : ConnectionNotificationState | Nil

    # The Region for the endpoint service.
    property service_region : String | Nil

    def initialize(
      @connection_notification_id : String | Nil = nil,
      @service_id : String | Nil = nil,
      @vpc_endpoint_id : String | Nil = nil,
      @connection_notification_type : ConnectionNotificationType | Nil = nil,
      @connection_notification_arn : String | Nil = nil,
      @connection_events : Array(String) | Nil = nil,
      @connection_notification_state : ConnectionNotificationState | Nil = nil,
      @service_region : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @connection_notification_id
        params << {"#{prefix}ConnectionNotificationId", value}
      end

      if value = @service_id
        params << {"#{prefix}ServiceId", value}
      end

      if value = @vpc_endpoint_id
        params << {"#{prefix}VpcEndpointId", value}
      end

      if value = @connection_notification_type
        params << {"#{prefix}ConnectionNotificationType", value.to_json_object_key}
      end

      if value = @connection_notification_arn
        params << {"#{prefix}ConnectionNotificationArn", value}
      end

      (@connection_events || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ConnectionEvents.#{i}", item}
      end

      if value = @connection_notification_state
        params << {"#{prefix}ConnectionNotificationState", value.to_json_object_key}
      end

      if value = @service_region
        params << {"#{prefix}ServiceRegion", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        connection_notification_id: Core::XMLValue.string(node.xpath_node("*[local-name()='connectionNotificationId']")),
        service_id: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceId']")),
        vpc_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcEndpointId']")),
        connection_notification_type: (n = node.xpath_node("*[local-name()='connectionNotificationType']")) ? AEC::ConnectionNotificationType.from_json_object_key?(n.content) : nil,
        connection_notification_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='connectionNotificationArn']")),
        connection_events: node.xpath_nodes("*[local-name()='connectionEvents']/*[local-name()='item']").map { |n| n.content },
        connection_notification_state: (n = node.xpath_node("*[local-name()='connectionNotificationState']")) ? AEC::ConnectionNotificationState.from_json_object_key?(n.content) : nil,
        service_region: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceRegion']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@connection_notification_id, @service_id, @vpc_endpoint_id, @connection_notification_type, @connection_notification_arn, @connection_events, @connection_notification_state, @service_region)
  end
end
