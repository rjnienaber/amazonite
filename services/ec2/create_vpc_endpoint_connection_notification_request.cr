private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVpcEndpointConnectionNotificationRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the endpoint service.
    property service_id : String | Nil

    # The ID of the endpoint.
    property vpc_endpoint_id : String | Nil

    # The ARN of the SNS topic for the notifications.
    property connection_notification_arn : String

    # The endpoint events for which to receive notifications. Valid values are `Accept`, `Connect`,
    # `Delete`, and `Reject`.
    property connection_events : Array(String) = [] of String

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [How to ensure
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    def initialize(
      @connection_notification_arn : String,
      @connection_events : Array(String),
      @dry_run : Bool | Nil = nil,
      @service_id : String | Nil = nil,
      @vpc_endpoint_id : String | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @service_id
        params << {"#{prefix}ServiceId", value}
      end

      if value = @vpc_endpoint_id
        params << {"#{prefix}VpcEndpointId", value}
      end

      params << {"#{prefix}ConnectionNotificationArn", @connection_notification_arn}

      @connection_events.each_with_index(1) do |item, i|
        params << {"#{prefix}ConnectionEvents.#{i}", item}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        service_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceId']")),
        vpc_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcEndpointId']")),
        connection_notification_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ConnectionNotificationArn']")).not_nil!,
        connection_events: node.xpath_nodes("*[local-name()='ConnectionEvents']/*[local-name()='item']").map { |n| n.content },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @service_id, @vpc_endpoint_id, @connection_notification_arn, @connection_events, @client_token)
  end
end
