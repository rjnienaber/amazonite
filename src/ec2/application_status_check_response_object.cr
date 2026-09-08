private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an application status check.
  class ApplicationStatusCheckResponseObject
    # The ID of the application status check.
    property application_status_check_id : String | Nil

    # The aggregation setting for the application status check. When set to `included`, the result of
    # this check contributes to the instance-level application status. When set to `excluded`, the
    # check runs independently and does not affect the instance-level status.
    property aggregation : AggregationStatusEnum | Nil

    # The health check paths for the application status check.
    property health_check_paths : Array(HealthCheckPathResponseObject) | Nil

    # The protocol used for the health check.
    property protocol : NetworkProtocolEnum | Nil

    # The port used for the health check.
    property port : Int32 | Nil

    # The URL path used for the health check HTTP request.
    property path : String | Nil

    # The index of the network device used for the health check. The value is greater than or equal to
    # 0.
    property device_index : Int32 | Nil

    # The IP version used for the health check.
    property ip_version : IpVersionEnum | Nil

    # The IP scope used for the health check.
    property ip_scope : IpScopeEnum | Nil

    # The interval, in seconds, between health checks. Valid value: 60.
    property interval : Int32 | Nil

    # The amount of time, in seconds, to wait for a health check response. Valid values: 1 to 30.
    property timeout : Int32 | Nil

    # The number of consecutive failed health checks before the application status is considered
    # impaired. The value must be greater than 0.
    property failure_threshold : Int32 | Nil

    # The number of consecutive successful health checks before the application status is considered
    # healthy. The value must be greater than 0.
    property success_threshold : Int32 | Nil

    # The comma-separated list of individual HTTP status codes or ranges that indicate a successful
    # health check response.
    property status_code_matcher : String | Nil

    # The number of seconds to wait before starting health checks after an instance is launched. Valid
    # values: 1 to 600.
    property initialization_grace_period_seconds : Int32 | Nil

    # The date and time when the application status check was last updated.
    property last_updated_at : Time | Nil

    # The [tags](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html) associated with
    # the application status check. Instances with these tags are automatically monitored by this
    # check.
    property target_tag_associations : Array(CustomTagKeyValueResponsePair) | Nil

    # The tags assigned to the application status check.
    property tags : Array(Tag) | Nil

    # The date and time when the application status check was created.
    property creation_time : Time | Nil

    # The date and time when the application status check was last modified.
    property modify_time : Time | Nil

    # The date and time when the application status check was deleted.
    property deletion_time : Time | Nil

    def initialize(
      @application_status_check_id : String | Nil = nil,
      @aggregation : AggregationStatusEnum | Nil = nil,
      @health_check_paths : Array(HealthCheckPathResponseObject) | Nil = nil,
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
      @last_updated_at : Time | Nil = nil,
      @target_tag_associations : Array(CustomTagKeyValueResponsePair) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @creation_time : Time | Nil = nil,
      @modify_time : Time | Nil = nil,
      @deletion_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @application_status_check_id
        params << {"#{prefix}ApplicationStatusCheckId", value}
      end

      if value = @aggregation
        params << {"#{prefix}Aggregation", value.to_json_object_key}
      end

      (@health_check_paths || [] of HealthCheckPathResponseObject).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}HealthCheckPathSet.#{i}."))
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

      if value = @last_updated_at
        params << {"#{prefix}LastUpdatedAt", Core::QueryValue.time(value)}
      end

      (@target_tag_associations || [] of CustomTagKeyValueResponsePair).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TargetTagAssociationSet.#{i}."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", Core::QueryValue.time(value)}
      end

      if value = @modify_time
        params << {"#{prefix}ModifyTime", Core::QueryValue.time(value)}
      end

      if value = @deletion_time
        params << {"#{prefix}DeletionTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        application_status_check_id: Core::XMLValue.string(node.xpath_node("*[local-name()='applicationStatusCheckId']")),
        aggregation: (n = node.xpath_node("*[local-name()='aggregation']")) ? AEC::AggregationStatusEnum.from_json_object_key?(n.content) : nil,
        health_check_paths: node.xpath_nodes("*[local-name()='healthCheckPathSet']/*[local-name()='item']").map { |n| HealthCheckPathResponseObject.from_xml(n) },
        protocol: (n = node.xpath_node("*[local-name()='protocol']")) ? AEC::NetworkProtocolEnum.from_json_object_key?(n.content) : nil,
        port: Core::XMLValue.i32(node.xpath_node("*[local-name()='port']")),
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='path']")),
        device_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='deviceIndex']")),
        ip_version: (n = node.xpath_node("*[local-name()='ipVersion']")) ? AEC::IpVersionEnum.from_json_object_key?(n.content) : nil,
        ip_scope: (n = node.xpath_node("*[local-name()='ipScope']")) ? AEC::IpScopeEnum.from_json_object_key?(n.content) : nil,
        interval: Core::XMLValue.i32(node.xpath_node("*[local-name()='interval']")),
        timeout: Core::XMLValue.i32(node.xpath_node("*[local-name()='timeout']")),
        failure_threshold: Core::XMLValue.i32(node.xpath_node("*[local-name()='failureThreshold']")),
        success_threshold: Core::XMLValue.i32(node.xpath_node("*[local-name()='successThreshold']")),
        status_code_matcher: Core::XMLValue.string(node.xpath_node("*[local-name()='statusCodeMatcher']")),
        initialization_grace_period_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='initializationGracePeriodSeconds']")),
        last_updated_at: Core::XMLValue.time(node.xpath_node("*[local-name()='lastUpdatedAt']")),
        target_tag_associations: node.xpath_nodes("*[local-name()='targetTagAssociationSet']/*[local-name()='item']").map { |n| CustomTagKeyValueResponsePair.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        modify_time: Core::XMLValue.time(node.xpath_node("*[local-name()='modifyTime']")),
        deletion_time: Core::XMLValue.time(node.xpath_node("*[local-name()='deletionTime']")),
      )
    end

    def validate! : Nil
      if value = @health_check_paths
        value.each(&.validate!)
      end

      if value = @initialization_grace_period_seconds
        raise Core::ValidationError.new("InitializationGracePeriodSeconds value must be >= -1") if value < -1
        raise Core::ValidationError.new("InitializationGracePeriodSeconds value must be <= 600") if value > 600
      end

      if value = @target_tag_associations
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@application_status_check_id, @aggregation, @health_check_paths, @protocol, @port, @path, @device_index, @ip_version, @ip_scope, @interval, @timeout, @failure_threshold, @success_threshold, @status_code_matcher, @initialization_grace_period_seconds, @last_updated_at, @target_tag_associations, @tags, @creation_time, @modify_time, @deletion_time)
  end
end
