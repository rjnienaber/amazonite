private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateFleetRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
    # you do not specify a client token, a randomly generated token is used for the request to ensure
    # idempotency.
    #
    # For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # Describes the configuration of Spot Instances in an EC2 Fleet.
    property spot_options : SpotOptionsRequest | Nil

    # Describes the configuration of On-Demand Instances in an EC2 Fleet.
    property on_demand_options : OnDemandOptionsRequest | Nil

    # Defines EC2 Fleet preferences for utilizing reserved capacity when DefaultTargetCapacityType is
    # set to `reserved-capacity`.
    #
    # Supported only for fleets of type `instant`.
    property reserved_capacity_options : ReservedCapacityOptionsRequest | Nil

    # Indicates whether running instances should be terminated if the total target capacity of the EC2
    # Fleet is decreased below the current size of the EC2 Fleet.
    #
    # Supported only for fleets of type `maintain`.
    property excess_capacity_termination_policy : FleetExcessCapacityTerminationPolicy | Nil

    # The configuration for the EC2 Fleet.
    property launch_template_configs : Array(FleetLaunchTemplateConfigRequest) = [] of FleetLaunchTemplateConfigRequest

    # The number of units to request.
    property target_capacity_specification : TargetCapacitySpecificationRequest

    # Indicates whether running instances should be terminated when the EC2 Fleet expires.
    property terminate_instances_with_expiration : Bool | Nil

    # The fleet type. The default value is `maintain`.
    #
    # - `maintain` - The EC2 Fleet places an asynchronous request for your desired capacity, and
    # continues to maintain your desired Spot capacity by replenishing interrupted Spot Instances.
    #
    # - `request` - The EC2 Fleet places an asynchronous one-time request for your desired capacity,
    # but does submit Spot requests in alternative capacity pools if Spot capacity is unavailable, and
    # does not maintain Spot capacity if Spot Instances are interrupted.
    #
    # - `instant` - The EC2 Fleet places a synchronous one-time request for your desired capacity, and
    # returns errors for any instances that could not be launched.
    #
    # For more information, see [EC2 Fleet request
    # types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-request-type.html) in the
    # *Amazon EC2 User Guide*.
    property type : FleetType | Nil

    # The start date and time of the request, in UTC format (for example,
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z). The default is to start fulfilling the request immediately.
    property valid_from : Time | Nil

    # The end date and time of the request, in UTC format (for example,
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z). At this point, no new EC2 Fleet requests are placed or able
    # to fulfill the request. If no value is specified, the request remains until you cancel it.
    property valid_until : Time | Nil

    # Indicates whether EC2 Fleet should replace unhealthy Spot Instances. Supported only for fleets
    # of type `maintain`. For more information, see [EC2 Fleet health
    # checks](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/manage-ec2-fleet.html#ec2-fleet-health-checks)
    # in the *Amazon EC2 User Guide*.
    property replace_unhealthy_instances : Bool | Nil

    # The key-value pair for tagging the EC2 Fleet request on creation. For more information, see [Tag
    # your
    # resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html#tag-resources).
    #
    # If the fleet type is `instant`, specify a resource type of `fleet` to tag the fleet, `instance`
    # to tag the instances at launch, `volume` to tag the volumes at launch, or `network-interface` to
    # tag the network interfaces at launch.
    #
    # If the fleet type is `maintain` or `request`, specify a resource type of `fleet` to tag the
    # fleet. You cannot specify a resource type of `instance`, `volume`, or `network-interface`. To
    # tag instances at launch, specify the tags in a [launch
    # template](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html#create-launch-template).
    property tag_specifications : Array(TagSpecification) | Nil

    # Reserved.
    property context : String | Nil

    def initialize(
      @launch_template_configs : Array(FleetLaunchTemplateConfigRequest),
      @target_capacity_specification : TargetCapacitySpecificationRequest,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
      @spot_options : SpotOptionsRequest | Nil = nil,
      @on_demand_options : OnDemandOptionsRequest | Nil = nil,
      @reserved_capacity_options : ReservedCapacityOptionsRequest | Nil = nil,
      @excess_capacity_termination_policy : FleetExcessCapacityTerminationPolicy | Nil = nil,
      @terminate_instances_with_expiration : Bool | Nil = nil,
      @type : FleetType | Nil = nil,
      @valid_from : Time | Nil = nil,
      @valid_until : Time | Nil = nil,
      @replace_unhealthy_instances : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @context : String | Nil = nil,
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

      if value = @spot_options
        params.concat(value.to_query_params("#{prefix}SpotOptions."))
      end

      if value = @on_demand_options
        params.concat(value.to_query_params("#{prefix}OnDemandOptions."))
      end

      if value = @reserved_capacity_options
        params.concat(value.to_query_params("#{prefix}ReservedCapacityOptions."))
      end

      if value = @excess_capacity_termination_policy
        params << {"#{prefix}ExcessCapacityTerminationPolicy", value.to_json_object_key}
      end

      @launch_template_configs.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LaunchTemplateConfigs.#{i}."))
      end

      params.concat(@target_capacity_specification.to_query_params("#{prefix}TargetCapacitySpecification."))

      if value = @terminate_instances_with_expiration
        params << {"#{prefix}TerminateInstancesWithExpiration", Core::QueryValue.bool(value)}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @valid_from
        params << {"#{prefix}ValidFrom", Core::QueryValue.time(value)}
      end

      if value = @valid_until
        params << {"#{prefix}ValidUntil", Core::QueryValue.time(value)}
      end

      if value = @replace_unhealthy_instances
        params << {"#{prefix}ReplaceUnhealthyInstances", Core::QueryValue.bool(value)}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @context
        params << {"#{prefix}Context", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        spot_options: node.xpath_node("*[local-name()='SpotOptions']").try { |n| SpotOptionsRequest.from_xml(n) },
        on_demand_options: node.xpath_node("*[local-name()='OnDemandOptions']").try { |n| OnDemandOptionsRequest.from_xml(n) },
        reserved_capacity_options: node.xpath_node("*[local-name()='ReservedCapacityOptions']").try { |n| ReservedCapacityOptionsRequest.from_xml(n) },
        excess_capacity_termination_policy: (n = node.xpath_node("*[local-name()='ExcessCapacityTerminationPolicy']")) ? AEC::FleetExcessCapacityTerminationPolicy.from_json_object_key?(n.content) : nil,
        launch_template_configs: node.xpath_nodes("*[local-name()='LaunchTemplateConfigs']/*[local-name()='item']").map { |n| FleetLaunchTemplateConfigRequest.from_xml(n) },
        target_capacity_specification: node.xpath_node("*[local-name()='TargetCapacitySpecification']").try { |n| TargetCapacitySpecificationRequest.from_xml(n) }.not_nil!,
        terminate_instances_with_expiration: Core::XMLValue.bool(node.xpath_node("*[local-name()='TerminateInstancesWithExpiration']")),
        type: (n = node.xpath_node("*[local-name()='Type']")) ? AEC::FleetType.from_json_object_key?(n.content) : nil,
        valid_from: Core::XMLValue.time(node.xpath_node("*[local-name()='ValidFrom']")),
        valid_until: Core::XMLValue.time(node.xpath_node("*[local-name()='ValidUntil']")),
        replace_unhealthy_instances: Core::XMLValue.bool(node.xpath_node("*[local-name()='ReplaceUnhealthyInstances']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        context: Core::XMLValue.string(node.xpath_node("*[local-name()='Context']")),
      )
    end

    def validate! : Nil
      if value = @spot_options
        value.validate!
      end

      if value = @on_demand_options
        value.validate!
      end

      if value = @reserved_capacity_options
        value.validate!
      end

      if value = @launch_template_configs
        raise Core::ValidationError.new("LaunchTemplateConfigs must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("LaunchTemplateConfigs must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end

      if value = @target_capacity_specification
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @client_token, @spot_options, @on_demand_options, @reserved_capacity_options, @excess_capacity_termination_policy, @launch_template_configs, @target_capacity_specification, @terminate_instances_with_expiration, @type, @valid_from, @valid_until, @replace_unhealthy_instances, @tag_specifications, @context)
  end
end
