private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a flow log.
  class FlowLog
    # The date and time the flow log was created.
    property creation_time : Time | Nil

    # Information about the error that occurred. `Rate limited` indicates that CloudWatch Logs
    # throttling has been applied for one or more network interfaces, or that you've reached the limit
    # on the number of log groups that you can create. `Access error` indicates that the IAM role
    # associated with the flow log does not have sufficient permissions to publish to CloudWatch Logs.
    # `Unknown error` indicates an internal error.
    property deliver_logs_error_message : String | Nil

    # The ARN of the IAM role allows the service to publish logs to CloudWatch Logs.
    property deliver_logs_permission_arn : String | Nil

    # The ARN of the IAM role that allows the service to publish flow logs across accounts.
    property deliver_cross_account_role : String | Nil

    # The status of the logs delivery (`SUCCESS` | `FAILED`).
    property deliver_logs_status : String | Nil

    # The ID of the flow log.
    property flow_log_id : String | Nil

    # The status of the flow log (`ACTIVE`).
    property flow_log_status : String | Nil

    # The name of the flow log group.
    property log_group_name : String | Nil

    # The ID of the resource being monitored.
    property resource_id : String | Nil

    # The type of traffic captured for the flow log.
    property traffic_type : TrafficType | Nil

    # The type of destination for the flow log data.
    property log_destination_type : LogDestinationType | Nil

    # The Amazon Resource Name (ARN) of the destination for the flow log data.
    property log_destination : String | Nil

    # The format of the flow log record.
    property log_format : String | Nil

    # The tags for the flow log.
    property tags : Array(Tag) | Nil

    # The maximum interval of time, in seconds, during which a flow of packets is captured and
    # aggregated into a flow log record.
    #
    # When a network interface is attached to a [Nitro-based
    # instance](https://docs.aws.amazon.com/ec2/latest/instancetypes/ec2-nitro-instances.html), the
    # aggregation interval is always 60 seconds (1 minute) or less, regardless of the specified value.
    #
    # Valid Values: `60` | `600`
    property max_aggregation_interval : Int32 | Nil

    # The destination options.
    property destination_options : DestinationOptionsResponse | Nil

    # The tag configuration associated with the Flow Logs Amazon EC2 Tags feature fields in your
    # custom log format.
    property tag_field_specifications : Array(TagFieldSpecificationResponse) | Nil

    def initialize(
      @creation_time : Time | Nil = nil,
      @deliver_logs_error_message : String | Nil = nil,
      @deliver_logs_permission_arn : String | Nil = nil,
      @deliver_cross_account_role : String | Nil = nil,
      @deliver_logs_status : String | Nil = nil,
      @flow_log_id : String | Nil = nil,
      @flow_log_status : String | Nil = nil,
      @log_group_name : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @traffic_type : TrafficType | Nil = nil,
      @log_destination_type : LogDestinationType | Nil = nil,
      @log_destination : String | Nil = nil,
      @log_format : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @max_aggregation_interval : Int32 | Nil = nil,
      @destination_options : DestinationOptionsResponse | Nil = nil,
      @tag_field_specifications : Array(TagFieldSpecificationResponse) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @creation_time
        params << {"#{prefix}CreationTime", Core::QueryValue.time(value)}
      end

      if value = @deliver_logs_error_message
        params << {"#{prefix}DeliverLogsErrorMessage", value}
      end

      if value = @deliver_logs_permission_arn
        params << {"#{prefix}DeliverLogsPermissionArn", value}
      end

      if value = @deliver_cross_account_role
        params << {"#{prefix}DeliverCrossAccountRole", value}
      end

      if value = @deliver_logs_status
        params << {"#{prefix}DeliverLogsStatus", value}
      end

      if value = @flow_log_id
        params << {"#{prefix}FlowLogId", value}
      end

      if value = @flow_log_status
        params << {"#{prefix}FlowLogStatus", value}
      end

      if value = @log_group_name
        params << {"#{prefix}LogGroupName", value}
      end

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @traffic_type
        params << {"#{prefix}TrafficType", value.to_json_object_key}
      end

      if value = @log_destination_type
        params << {"#{prefix}LogDestinationType", value.to_json_object_key}
      end

      if value = @log_destination
        params << {"#{prefix}LogDestination", value}
      end

      if value = @log_format
        params << {"#{prefix}LogFormat", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @max_aggregation_interval
        params << {"#{prefix}MaxAggregationInterval", value.to_s}
      end

      if value = @destination_options
        params.concat(value.to_query_params("#{prefix}DestinationOptions."))
      end

      (@tag_field_specifications || [] of TagFieldSpecificationResponse).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagFieldSpecificationSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        deliver_logs_error_message: Core::XMLValue.string(node.xpath_node("*[local-name()='deliverLogsErrorMessage']")),
        deliver_logs_permission_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='deliverLogsPermissionArn']")),
        deliver_cross_account_role: Core::XMLValue.string(node.xpath_node("*[local-name()='deliverCrossAccountRole']")),
        deliver_logs_status: Core::XMLValue.string(node.xpath_node("*[local-name()='deliverLogsStatus']")),
        flow_log_id: Core::XMLValue.string(node.xpath_node("*[local-name()='flowLogId']")),
        flow_log_status: Core::XMLValue.string(node.xpath_node("*[local-name()='flowLogStatus']")),
        log_group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='logGroupName']")),
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        traffic_type: (n = node.xpath_node("*[local-name()='trafficType']")) ? AEC::TrafficType.from_json_object_key?(n.content) : nil,
        log_destination_type: (n = node.xpath_node("*[local-name()='logDestinationType']")) ? AEC::LogDestinationType.from_json_object_key?(n.content) : nil,
        log_destination: Core::XMLValue.string(node.xpath_node("*[local-name()='logDestination']")),
        log_format: Core::XMLValue.string(node.xpath_node("*[local-name()='logFormat']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        max_aggregation_interval: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxAggregationInterval']")),
        destination_options: node.xpath_node("*[local-name()='destinationOptions']").try { |n| DestinationOptionsResponse.from_xml(n) },
        tag_field_specifications: node.xpath_nodes("*[local-name()='tagFieldSpecificationSet']/*[local-name()='item']").map { |n| TagFieldSpecificationResponse.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end

      if value = @destination_options
        value.validate!
      end

      if value = @tag_field_specifications
        raise Core::ValidationError.new("TagFieldSpecifications must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("TagFieldSpecifications must have at most 3 item(s)") if value.size > 3
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@creation_time, @deliver_logs_error_message, @deliver_logs_permission_arn, @deliver_cross_account_role, @deliver_logs_status, @flow_log_id, @flow_log_status, @log_group_name, @resource_id, @traffic_type, @log_destination_type, @log_destination, @log_format, @tags, @max_aggregation_interval, @destination_options, @tag_field_specifications)
  end
end
