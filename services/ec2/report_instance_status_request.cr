private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReportInstanceStatusRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The instances.
    property instances : Array(String) = [] of String

    # The status of all instances listed.
    property status : ReportStatusType

    # The time at which the reported instance health state began.
    property start_time : Time | Nil

    # The time at which the reported instance health state ended.
    property end_time : Time | Nil

    # The reason codes that describe the health state of your instance.
    #
    # - `instance-stuck-in-state`: My instance is stuck in a state.
    #
    # - `unresponsive`: My instance is unresponsive.
    #
    # - `not-accepting-credentials`: My instance is not accepting my credentials.
    #
    # - `password-not-available`: A password is not available for my instance.
    #
    # - `performance-network`: My instance is experiencing performance problems that I believe are
    # network related.
    #
    # - `performance-instance-store`: My instance is experiencing performance problems that I believe
    # are related to the instance stores.
    #
    # - `performance-ebs-volume`: My instance is experiencing performance problems that I believe are
    # related to an EBS volume.
    #
    # - `performance-other`: My instance is experiencing performance problems.
    #
    # - `other`: [explain using the description parameter]
    property reason_codes : Array(ReportInstanceReasonCodes) = [] of ReportInstanceReasonCodes

    # Descriptive text about the health state of your instance.
    property description : String | Nil

    def initialize(
      @instances : Array(String),
      @status : ReportStatusType,
      @reason_codes : Array(ReportInstanceReasonCodes),
      @dry_run : Bool | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      @instances.each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceId.#{i}", item}
      end

      params << {"#{prefix}Status", @status.to_json_object_key}

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      if value = @end_time
        params << {"#{prefix}EndTime", Core::QueryValue.time(value)}
      end

      @reason_codes.each_with_index(1) do |item, i|
        params << {"#{prefix}ReasonCode.#{i}", item.to_json_object_key}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        instances: node.xpath_nodes("*[local-name()='instanceId']/*[local-name()='InstanceId']").map { |n| n.content },
        status: ((n = node.xpath_node("*[local-name()='status']")) ? AEC::ReportStatusType.from_json_object_key?(n.content) : nil).not_nil!,
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='startTime']")),
        end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='endTime']")),
        reason_codes: node.xpath_nodes("*[local-name()='reasonCode']/*[local-name()='item']").compact_map { |n| AEC::ReportInstanceReasonCodes.from_json_object_key?(n.content) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @instances, @status, @start_time, @end_time, @reason_codes, @description)
  end
end
