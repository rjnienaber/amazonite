private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyApplicationStatusCheckRequest
    # The ID of the application status check to modify.
    property application_status_check_id : String

    # The aggregation setting for the application status check. When set to `included`, the result of
    # this check contributes to the instance-level application status reported by
    # `DescribeApplicationStatus`. When set to `excluded`, the check runs independently and does not
    # affect the instance-level status. Valid values: `included` | `excluded`.
    property aggregation : AggregationStatusEnum | Nil

    # The health check paths to use for the application status check.
    property health_check_paths : Array(HealthCheckPathRequestObject) | Nil

    # The protocol to use for the health check. Valid values: `http` | `https`.
    property protocol : NetworkProtocolEnum | Nil

    # The port to use for the health check. Valid values: 1 to 65535.
    property port : Int32 | Nil

    # The URL path to use for the health check HTTP request (for example, `/health` or `/status`).
    property path : String | Nil

    # The index of the network device to use for the health check. The value must be greater than or
    # equal to 0.
    property device_index : Int32 | Nil

    # The IP version to use for the health check. Valid values: `ipv4` and `ipv6`.
    property ip_version : IpVersionEnum | Nil

    # The IP scope to use for the health check. Valid value: `private`.
    property ip_scope : IpScopeEnum | Nil

    # The interval, in seconds, between health checks. Valid value: 60.
    property interval : Int32 | Nil

    # The amount of time, in seconds, to wait for a health check response before considering it
    # failed. Valid values: 1 to 30. The value must be less than `Interval`.
    property timeout : Int32 | Nil

    # The number of consecutive failed health checks before the application status is considered
    # impaired. The value must be greater than 0.
    property failure_threshold : Int32 | Nil

    # The number of consecutive successful health checks before the application status is considered
    # healthy. The value must be greater than 0.
    property success_threshold : Int32 | Nil

    # The HTTP status codes that indicate a successful health check response. Specify a
    # comma-separated list of individual status codes or ranges, for example, `200,202,300-399`. For a
    # range, the first value must be less than the second value. Maximum length: 64 characters.
    property status_code_matcher : String | Nil

    # The number of seconds to wait before starting health checks after an instance is launched. Valid
    # values: 1 to 600.
    property initialization_grace_period_seconds : Int32 | Nil

    # A unique, case-sensitive identifier that you provide to ensure that the operation completes no
    # more than one time. If you retry a request with the same token, the service ignores the request
    # but does not return an error. For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @application_status_check_id : String,
      @aggregation : AggregationStatusEnum | Nil = nil,
      @health_check_paths : Array(HealthCheckPathRequestObject) | Nil = nil,
      @protocol : NetworkProtocolEnum | Nil = nil,
      @port : Int32 | Nil = nil,
      @path : String | Nil = nil,
      @device_index : Int32 | Nil = nil,
      @ip_version : IpVersionEnum | Nil = nil,
      @ip_scope : IpScopeEnum | Nil = nil,
      @interval : Int32 | Nil = nil,
      @timeout : Int32 | Nil = nil,
      @failure_threshold : Int32 | Nil = nil,
      @success_threshold : Int32 | Nil = nil,
      @status_code_matcher : String | Nil = nil,
      @initialization_grace_period_seconds : Int32 | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ApplicationStatusCheckId", @application_status_check_id}

      if value = @aggregation
        params << {"#{prefix}Aggregation", value.to_json_object_key}
      end

      (@health_check_paths || [] of HealthCheckPathRequestObject).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}HealthCheckPath.#{i}."))
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value.to_json_object_key}
      end

      if value = @port
        params << {"#{prefix}Port", value.to_s}
      end

      if value = @path
        params << {"#{prefix}Path", value}
      end

      if value = @device_index
        params << {"#{prefix}DeviceIndex", value.to_s}
      end

      if value = @ip_version
        params << {"#{prefix}IpVersion", value.to_json_object_key}
      end

      if value = @ip_scope
        params << {"#{prefix}IpScope", value.to_json_object_key}
      end

      if value = @interval
        params << {"#{prefix}Interval", value.to_s}
      end

      if value = @timeout
        params << {"#{prefix}Timeout", value.to_s}
      end

      if value = @failure_threshold
        params << {"#{prefix}FailureThreshold", value.to_s}
      end

      if value = @success_threshold
        params << {"#{prefix}SuccessThreshold", value.to_s}
      end

      if value = @status_code_matcher
        params << {"#{prefix}StatusCodeMatcher", value}
      end

      if value = @initialization_grace_period_seconds
        params << {"#{prefix}InitializationGracePeriodSeconds", value.to_s}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        application_status_check_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ApplicationStatusCheckId']")).not_nil!,
        aggregation: (n = node.xpath_node("*[local-name()='Aggregation']")) ? AEC::AggregationStatusEnum.from_json_object_key?(n.content) : nil,
        health_check_paths: node.xpath_nodes("*[local-name()='HealthCheckPath']/*[local-name()='item']").map { |n| HealthCheckPathRequestObject.from_xml(n) },
        protocol: (n = node.xpath_node("*[local-name()='Protocol']")) ? AEC::NetworkProtocolEnum.from_json_object_key?(n.content) : nil,
        port: Core::XMLValue.i32(node.xpath_node("*[local-name()='Port']")),
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        device_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='DeviceIndex']")),
        ip_version: (n = node.xpath_node("*[local-name()='IpVersion']")) ? AEC::IpVersionEnum.from_json_object_key?(n.content) : nil,
        ip_scope: (n = node.xpath_node("*[local-name()='IpScope']")) ? AEC::IpScopeEnum.from_json_object_key?(n.content) : nil,
        interval: Core::XMLValue.i32(node.xpath_node("*[local-name()='Interval']")),
        timeout: Core::XMLValue.i32(node.xpath_node("*[local-name()='Timeout']")),
        failure_threshold: Core::XMLValue.i32(node.xpath_node("*[local-name()='FailureThreshold']")),
        success_threshold: Core::XMLValue.i32(node.xpath_node("*[local-name()='SuccessThreshold']")),
        status_code_matcher: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusCodeMatcher']")),
        initialization_grace_period_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='InitializationGracePeriodSeconds']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @health_check_paths
        value.each(&.validate!)
      end

      if value = @port
        raise Core::ValidationError.new("Port value must be >= 1") if value < 1
        raise Core::ValidationError.new("Port value must be <= 65535") if value > 65535
      end

      if value = @initialization_grace_period_seconds
        raise Core::ValidationError.new("InitializationGracePeriodSeconds value must be >= -1") if value < -1
        raise Core::ValidationError.new("InitializationGracePeriodSeconds value must be <= 600") if value > 600
      end
    end

    def_equals_and_hash(@application_status_check_id, @aggregation, @health_check_paths, @protocol, @port, @path, @device_index, @ip_version, @ip_scope, @interval, @timeout, @failure_threshold, @success_threshold, @status_code_matcher, @initialization_grace_period_seconds, @client_token, @dry_run)
  end
end
