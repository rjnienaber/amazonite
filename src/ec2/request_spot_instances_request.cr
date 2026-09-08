private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for RequestSpotInstances.
  class RequestSpotInstancesRequest
    # The launch specification.
    property launch_specification : RequestSpotLaunchSpecification | Nil

    # The key-value pair for tagging the Spot Instance request on creation. The value for
    # `ResourceType` must be `spot-instances-request`, otherwise the Spot Instance request fails. To
    # tag the Spot Instance request after it has been created, see
    # [CreateTags](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTags.html).
    property tag_specifications : Array(TagSpecification) | Nil

    # The behavior when a Spot Instance is interrupted. The default is `terminate`.
    property instance_interruption_behavior : InstanceInterruptionBehavior | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The maximum price per unit hour that you are willing to pay for a Spot Instance. We do not
    # recommend using this parameter because it can lead to increased interruptions. If you do not
    # specify this parameter, you will pay the current Spot price.
    #
    # If you specify a maximum price, your instances will be interrupted more frequently than if you
    # do not specify this parameter.
    property spot_price : String | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring idempotency in Amazon EC2 API
    # requests](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html) in
    # the *Amazon EC2 User Guide*.
    property client_token : String | Nil

    # The maximum number of Spot Instances to launch.
    #
    # Default: 1
    property instance_count : Int32 | Nil

    # The Spot Instance request type.
    #
    # Default: `one-time`
    property type : SpotInstanceType | Nil

    # The start date of the request. If this is a one-time request, the request becomes active at this
    # date and time and remains active until all instances launch, the request expires, or the request
    # is canceled. If the request is persistent, the request becomes active at this date and time and
    # remains active until it expires or is canceled.
    #
    # The specified start date and time cannot be equal to the current date and time. You must specify
    # a start date and time that occurs after the current date and time.
    property valid_from : Time | Nil

    # The end date of the request, in UTC format (*YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z).
    #
    # - For a persistent request, the request remains active until the `ValidUntil` date and time is
    # reached. Otherwise, the request remains active until you cancel it.
    #
    # - For a one-time request, the request remains active until all instances launch, the request is
    # canceled, or the `ValidUntil` date and time is reached. By default, the request is valid for 7
    # days from the date the request was created.
    property valid_until : Time | Nil

    # The instance launch group. Launch groups are Spot Instances that launch together and terminate
    # together.
    #
    # Default: Instances are launched and terminated individually
    property launch_group : String | Nil

    # The user-specified name for a logical grouping of requests.
    #
    # When you specify an Availability Zone group in a Spot Instance request, all Spot Instances in
    # the request are launched in the same Availability Zone. Instance proximity is maintained with
    # this parameter, but the choice of Availability Zone is not. The group applies only to requests
    # for Spot Instances of the same instance type. Any additional Spot Instance requests that are
    # specified with the same Availability Zone group name are launched in that same Availability
    # Zone, as long as at least one instance from the group is still active.
    #
    # If there is no active instance running in the Availability Zone group that you specify for a new
    # Spot Instance request (all instances are terminated, the request is expired, or the maximum
    # price you specified falls below current Spot price), then Amazon EC2 launches the instance in
    # any Availability Zone where the constraint can be met. Consequently, the subsequent set of Spot
    # Instances could be placed in a different zone from the original request, even if you specified
    # the same Availability Zone group.
    #
    # Default: Instances are launched in any available Availability Zone.
    property availability_zone_group : String | Nil

    # Deprecated.
    property block_duration_minutes : Int32 | Nil

    def initialize(
      @launch_specification : RequestSpotLaunchSpecification | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @instance_interruption_behavior : InstanceInterruptionBehavior | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @spot_price : String | Nil = nil,
      @client_token : String | Nil = nil,
      @instance_count : Int32 | Nil = nil,
      @type : SpotInstanceType | Nil = nil,
      @valid_from : Time | Nil = nil,
      @valid_until : Time | Nil = nil,
      @launch_group : String | Nil = nil,
      @availability_zone_group : String | Nil = nil,
      @block_duration_minutes : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @launch_specification
        params.concat(value.to_query_params("#{prefix}LaunchSpecification."))
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @instance_interruption_behavior
        params << {"#{prefix}InstanceInterruptionBehavior", value.to_json_object_key}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @spot_price
        params << {"#{prefix}SpotPrice", value}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
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

      if value = @launch_group
        params << {"#{prefix}LaunchGroup", value}
      end

      if value = @availability_zone_group
        params << {"#{prefix}AvailabilityZoneGroup", value}
      end

      if value = @block_duration_minutes
        params << {"#{prefix}BlockDurationMinutes", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_specification: node.xpath_node("*[local-name()='LaunchSpecification']").try { |n| RequestSpotLaunchSpecification.from_xml(n) },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        instance_interruption_behavior: (n = node.xpath_node("*[local-name()='InstanceInterruptionBehavior']")) ? AEC::InstanceInterruptionBehavior.from_json_object_key?(n.content) : nil,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        spot_price: Core::XMLValue.string(node.xpath_node("*[local-name()='spotPrice']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::SpotInstanceType.from_json_object_key?(n.content) : nil,
        valid_from: Core::XMLValue.time(node.xpath_node("*[local-name()='validFrom']")),
        valid_until: Core::XMLValue.time(node.xpath_node("*[local-name()='validUntil']")),
        launch_group: Core::XMLValue.string(node.xpath_node("*[local-name()='launchGroup']")),
        availability_zone_group: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneGroup']")),
        block_duration_minutes: Core::XMLValue.i32(node.xpath_node("*[local-name()='blockDurationMinutes']")),
      )
    end

    def validate! : Nil
      if value = @launch_specification
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@launch_specification, @tag_specifications, @instance_interruption_behavior, @dry_run, @spot_price, @client_token, @instance_count, @type, @valid_from, @valid_until, @launch_group, @availability_zone_group, @block_duration_minutes)
  end
end
