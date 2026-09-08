private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateFlowLogsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [How to ensure
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # The ARN of the IAM role that allows Amazon EC2 to publish flow logs to the log destination.
    #
    # This parameter is required if the destination type is `cloud-watch-logs`, or if the destination
    # type is `kinesis-data-firehose` and the delivery stream and the resources to monitor are in
    # different accounts.
    property deliver_logs_permission_arn : String | Nil

    # The ARN of the IAM role that allows Amazon EC2 to publish flow logs across accounts.
    property deliver_cross_account_role : String | Nil

    # The name of a new or existing CloudWatch Logs log group where Amazon EC2 publishes your flow
    # logs.
    #
    # This parameter is valid only if the destination type is `cloud-watch-logs`.
    property log_group_name : String | Nil

    # The IDs of the resources to monitor. For example, if the resource type is `VPC`, specify the IDs
    # of the VPCs.
    #
    # Constraints: Maximum of 25 for transit gateway resource types. Maximum of 300 for the other
    # resource types.
    property resource_ids : Array(String) = [] of String

    # The type of resource to monitor.
    property resource_type : FlowLogsResourceType

    # The type of traffic to monitor (accepted traffic, rejected traffic, or all traffic). This
    # parameter is not supported for transit gateway resource types. It is required for the other
    # resource types.
    property traffic_type : TrafficType | Nil

    # The type of destination for the flow log data.
    #
    # Default: `cloud-watch-logs`
    property log_destination_type : LogDestinationType | Nil

    # The destination for the flow log data. The meaning of this parameter depends on the destination
    # type.
    #
    # - If the destination type is `cloud-watch-logs`, specify the ARN of a CloudWatch Logs log group.
    # For example:
    #
    # arn:aws:logs:*region*:*account_id*:log-group:*my_group*
    #
    # Alternatively, use the `LogGroupName` parameter.
    #
    # - If the destination type is `s3`, specify the ARN of an S3 bucket. For example:
    #
    # arn:aws:s3:::*my_bucket*/*my_subfolder*/
    #
    # The subfolder is optional. Note that you can't use `AWSLogs` as a subfolder name.
    #
    # - If the destination type is `kinesis-data-firehose`, specify the ARN of a Kinesis Data Firehose
    # delivery stream. For example:
    #
    # arn:aws:firehose:*region*:*account_id*:deliverystream:*my_stream*
    property log_destination : String | Nil

    # The fields to include in the flow log record. List the fields in the order in which they should
    # appear. If you omit this parameter, the flow log is created using the default format. If you
    # specify this parameter, you must include at least one field. For more information about the
    # available fields, see [Flow log
    # records](https://docs.aws.amazon.com/vpc/latest/userguide/flow-log-records.html) in the *Amazon
    # VPC User Guide* or [Transit Gateway Flow Log
    # records](https://docs.aws.amazon.com/vpc/latest/tgw/tgw-flow-logs.html#flow-log-records) in the
    # *Amazon Web Services Transit Gateway Guide*.
    #
    # Specify the fields using the `${field-id}` format, separated by spaces.
    property log_format : String | Nil

    # The tags to apply to the flow logs.
    property tag_specifications : Array(TagSpecification) | Nil

    # The maximum interval of time during which a flow of packets is captured and aggregated into a
    # flow log record. The possible values are 60 seconds (1 minute) or 600 seconds (10 minutes). This
    # parameter must be 60 seconds for transit gateway resource types.
    #
    # When a network interface is attached to a [Nitro-based
    # instance](https://docs.aws.amazon.com/ec2/latest/instancetypes/ec2-nitro-instances.html), the
    # aggregation interval is always 60 seconds or less, regardless of the value that you specify.
    #
    # Default: 600
    property max_aggregation_interval : Int32 | Nil

    # The destination options.
    property destination_options : DestinationOptionsRequest | Nil

    # The tag configuration associated with the Flow Logs Amazon EC2 Tags feature fields in your
    # custom log format.
    property tag_field_specifications : Array(TagFieldSpecificationRequest) | Nil

    def initialize(
      @resource_ids : Array(String),
      @resource_type : FlowLogsResourceType,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
      @deliver_logs_permission_arn : String | Nil = nil,
      @deliver_cross_account_role : String | Nil = nil,
      @log_group_name : String | Nil = nil,
      @traffic_type : TrafficType | Nil = nil,
      @log_destination_type : LogDestinationType | Nil = nil,
      @log_destination : String | Nil = nil,
      @log_format : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @max_aggregation_interval : Int32 | Nil = nil,
      @destination_options : DestinationOptionsRequest | Nil = nil,
      @tag_field_specifications : Array(TagFieldSpecificationRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @deliver_logs_permission_arn
        params << {"#{prefix}DeliverLogsPermissionArn", value}
      end

      if value = @deliver_cross_account_role
        params << {"#{prefix}DeliverCrossAccountRole", value}
      end

      if value = @log_group_name
        params << {"#{prefix}LogGroupName", value}
      end

      @resource_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}ResourceId.#{i}", item}
      end

      params << {"#{prefix}ResourceType", @resource_type.to_json_object_key}

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

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @max_aggregation_interval
        params << {"#{prefix}MaxAggregationInterval", value.to_s}
      end

      if value = @destination_options
        params.concat(value.to_query_params("#{prefix}DestinationOptions."))
      end

      (@tag_field_specifications || [] of TagFieldSpecificationRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagFieldSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        deliver_logs_permission_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='DeliverLogsPermissionArn']")),
        deliver_cross_account_role: Core::XMLValue.string(node.xpath_node("*[local-name()='DeliverCrossAccountRole']")),
        log_group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='LogGroupName']")),
        resource_ids: node.xpath_nodes("*[local-name()='ResourceId']/*[local-name()='item']").map { |n| n.content },
        resource_type: ((n = node.xpath_node("*[local-name()='ResourceType']")) ? AEC::FlowLogsResourceType.from_json_object_key?(n.content) : nil).not_nil!,
        traffic_type: (n = node.xpath_node("*[local-name()='TrafficType']")) ? AEC::TrafficType.from_json_object_key?(n.content) : nil,
        log_destination_type: (n = node.xpath_node("*[local-name()='LogDestinationType']")) ? AEC::LogDestinationType.from_json_object_key?(n.content) : nil,
        log_destination: Core::XMLValue.string(node.xpath_node("*[local-name()='LogDestination']")),
        log_format: Core::XMLValue.string(node.xpath_node("*[local-name()='LogFormat']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        max_aggregation_interval: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxAggregationInterval']")),
        destination_options: node.xpath_node("*[local-name()='DestinationOptions']").try { |n| DestinationOptionsRequest.from_xml(n) },
        tag_field_specifications: node.xpath_nodes("*[local-name()='TagFieldSpecification']/*[local-name()='item']").map { |n| TagFieldSpecificationRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
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

    def_equals_and_hash(@dry_run, @client_token, @deliver_logs_permission_arn, @deliver_cross_account_role, @log_group_name, @resource_ids, @resource_type, @traffic_type, @log_destination_type, @log_destination, @log_format, @tag_specifications, @max_aggregation_interval, @destination_options, @tag_field_specifications)
  end
end
