private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Spot Instance request.
  class SpotInstanceRequest
    # Deprecated.
    property actual_block_hourly_price : String | Nil

    # The Availability Zone group. If you specify the same Availability Zone group for all Spot
    # Instance requests, all Spot Instances are launched in the same Availability Zone.
    property availability_zone_group : String | Nil

    # Deprecated.
    property block_duration_minutes : Int32 | Nil

    # The date and time when the Spot Instance request was created, in UTC format (for example,
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z).
    property create_time : Time | Nil

    # The fault codes for the Spot Instance request, if any.
    property fault : SpotInstanceStateFault | Nil

    # The instance ID, if an instance has been launched to fulfill the Spot Instance request.
    property instance_id : String | Nil

    # The instance launch group. Launch groups are Spot Instances that launch together and terminate
    # together.
    property launch_group : String | Nil

    # Additional information for launching instances.
    property launch_specification : LaunchSpecification | Nil

    # The Availability Zone in which the request is launched.
    #
    # Either `launchedAvailabilityZone` or `launchedAvailabilityZoneId` can be specified, but not both
    property launched_availability_zone : String | Nil

    # The ID of the Availability Zone in which the request is launched.
    #
    # Either `launchedAvailabilityZone` or `launchedAvailabilityZoneId` can be specified, but not both
    property launched_availability_zone_id : String | Nil

    # The product description associated with the Spot Instance.
    property product_description : RIProductDescription | Nil

    # The ID of the Spot Instance request.
    property spot_instance_request_id : String | Nil

    # The maximum price per unit hour that you are willing to pay for a Spot Instance. We do not
    # recommend using this parameter because it can lead to increased interruptions. If you do not
    # specify this parameter, you will pay the current Spot price.
    #
    # If you specify a maximum price, your instances will be interrupted more frequently than if you
    # do not specify this parameter.
    property spot_price : String | Nil

    # The state of the Spot Instance request. Spot request status information helps track your Spot
    # Instance requests. For more information, see [Spot request
    # status](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-request-status.html) in the
    # *Amazon EC2 User Guide*.
    property state : SpotInstanceState | Nil

    # The status code and status message describing the Spot Instance request.
    property status : SpotInstanceStatus | Nil

    # Any tags assigned to the resource.
    property tags : Array(Tag) | Nil

    # The Spot Instance request type.
    property type : SpotInstanceType | Nil

    # The start date of the request, in UTC format (for example, *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z).
    # The request becomes active at this date and time.
    property valid_from : Time | Nil

    # The end date of the request, in UTC format (*YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z).
    #
    # - For a persistent request, the request remains active until the `validUntil` date and time is
    # reached. Otherwise, the request remains active until you cancel it.
    #
    # - For a one-time request, the request remains active until all instances launch, the request is
    # canceled, or the `validUntil` date and time is reached. By default, the request is valid for 7
    # days from the date the request was created.
    property valid_until : Time | Nil

    # The behavior when a Spot Instance is interrupted.
    property instance_interruption_behavior : InstanceInterruptionBehavior | Nil

    def initialize(
      @actual_block_hourly_price : String | Nil = nil,
      @availability_zone_group : String | Nil = nil,
      @block_duration_minutes : Int32 | Nil = nil,
      @create_time : Time | Nil = nil,
      @fault : SpotInstanceStateFault | Nil = nil,
      @instance_id : String | Nil = nil,
      @launch_group : String | Nil = nil,
      @launch_specification : LaunchSpecification | Nil = nil,
      @launched_availability_zone : String | Nil = nil,
      @launched_availability_zone_id : String | Nil = nil,
      @product_description : RIProductDescription | Nil = nil,
      @spot_instance_request_id : String | Nil = nil,
      @spot_price : String | Nil = nil,
      @state : SpotInstanceState | Nil = nil,
      @status : SpotInstanceStatus | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @type : SpotInstanceType | Nil = nil,
      @valid_from : Time | Nil = nil,
      @valid_until : Time | Nil = nil,
      @instance_interruption_behavior : InstanceInterruptionBehavior | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @actual_block_hourly_price
        params << {"#{prefix}ActualBlockHourlyPrice", value}
      end

      if value = @availability_zone_group
        params << {"#{prefix}AvailabilityZoneGroup", value}
      end

      if value = @block_duration_minutes
        params << {"#{prefix}BlockDurationMinutes", value.to_s}
      end

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      if value = @fault
        params.concat(value.to_query_params("#{prefix}Fault."))
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @launch_group
        params << {"#{prefix}LaunchGroup", value}
      end

      if value = @launch_specification
        params.concat(value.to_query_params("#{prefix}LaunchSpecification."))
      end

      if value = @launched_availability_zone
        params << {"#{prefix}LaunchedAvailabilityZone", value}
      end

      if value = @launched_availability_zone_id
        params << {"#{prefix}LaunchedAvailabilityZoneId", value}
      end

      if value = @product_description
        params << {"#{prefix}ProductDescription", value.to_json_object_key}
      end

      if value = @spot_instance_request_id
        params << {"#{prefix}SpotInstanceRequestId", value}
      end

      if value = @spot_price
        params << {"#{prefix}SpotPrice", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
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

      if value = @instance_interruption_behavior
        params << {"#{prefix}InstanceInterruptionBehavior", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        actual_block_hourly_price: Core::XMLValue.string(node.xpath_node("*[local-name()='actualBlockHourlyPrice']")),
        availability_zone_group: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneGroup']")),
        block_duration_minutes: Core::XMLValue.i32(node.xpath_node("*[local-name()='blockDurationMinutes']")),
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        fault: node.xpath_node("*[local-name()='fault']").try { |n| SpotInstanceStateFault.from_xml(n) },
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        launch_group: Core::XMLValue.string(node.xpath_node("*[local-name()='launchGroup']")),
        launch_specification: node.xpath_node("*[local-name()='launchSpecification']").try { |n| LaunchSpecification.from_xml(n) },
        launched_availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='launchedAvailabilityZone']")),
        launched_availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='launchedAvailabilityZoneId']")),
        product_description: (n = node.xpath_node("*[local-name()='productDescription']")) ? AEC::RIProductDescription.from_json_object_key?(n.content) : nil,
        spot_instance_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='spotInstanceRequestId']")),
        spot_price: Core::XMLValue.string(node.xpath_node("*[local-name()='spotPrice']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::SpotInstanceState.from_json_object_key?(n.content) : nil,
        status: node.xpath_node("*[local-name()='status']").try { |n| SpotInstanceStatus.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::SpotInstanceType.from_json_object_key?(n.content) : nil,
        valid_from: Core::XMLValue.time(node.xpath_node("*[local-name()='validFrom']")),
        valid_until: Core::XMLValue.time(node.xpath_node("*[local-name()='validUntil']")),
        instance_interruption_behavior: (n = node.xpath_node("*[local-name()='instanceInterruptionBehavior']")) ? AEC::InstanceInterruptionBehavior.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @fault
        value.validate!
      end

      if value = @launch_specification
        value.validate!
      end

      if value = @status
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@actual_block_hourly_price, @availability_zone_group, @block_duration_minutes, @create_time, @fault, @instance_id, @launch_group, @launch_specification, @launched_availability_zone, @launched_availability_zone_id, @product_description, @spot_instance_request_id, @spot_price, @state, @status, @tags, @type, @valid_from, @valid_until, @instance_interruption_behavior)
  end
end
