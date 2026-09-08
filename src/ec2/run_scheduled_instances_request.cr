private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for RunScheduledInstances.
  class RunScheduledInstancesRequest
    # Unique, case-sensitive identifier that ensures the idempotency of the request. For more
    # information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The number of instances.
    #
    # Default: 1
    property instance_count : Int32 | Nil

    # The launch specification. You must match the instance type, Availability Zone, network, and
    # platform of the schedule that you purchased.
    property launch_specification : ScheduledInstancesLaunchSpecification

    # The Scheduled Instance ID.
    property scheduled_instance_id : String

    def initialize(
      @launch_specification : ScheduledInstancesLaunchSpecification,
      @scheduled_instance_id : String,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @instance_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      params.concat(@launch_specification.to_query_params("#{prefix}LaunchSpecification."))

      params << {"#{prefix}ScheduledInstanceId", @scheduled_instance_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='InstanceCount']")),
        launch_specification: node.xpath_node("*[local-name()='LaunchSpecification']").try { |n| ScheduledInstancesLaunchSpecification.from_xml(n) }.not_nil!,
        scheduled_instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ScheduledInstanceId']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @launch_specification
        value.validate!
      end
    end

    def_equals_and_hash(@client_token, @dry_run, @instance_count, @launch_specification, @scheduled_instance_id)
  end
end
