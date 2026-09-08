private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEndpointConnectionNotificationsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the notification.
    property connection_notification_id : String | Nil

    # The filters.
    #
    # - `connection-notification-arn` - The ARN of the SNS topic for the notification.
    #
    # - `connection-notification-id` - The ID of the notification.
    #
    # - `connection-notification-state` - The state of the notification (`Enabled` | `Disabled`).
    #
    # - `connection-notification-type` - The type of notification (`Topic`).
    #
    # - `service-id` - The ID of the endpoint service.
    #
    # - `vpc-endpoint-id` - The ID of the VPC endpoint.
    property filters : Array(Filter) | Nil

    # The maximum number of results to return in a single call. To retrieve the remaining results,
    # make another request with the returned `NextToken` value.
    property max_results : Int32 | Nil

    # The token to request the next page of results.
    property next_token : String | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @connection_notification_id : String | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @connection_notification_id
        params << {"#{prefix}ConnectionNotificationId", value}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        connection_notification_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ConnectionNotificationId']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @connection_notification_id, @filters, @max_results, @next_token)
  end
end
