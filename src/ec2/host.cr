private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the properties of the Dedicated Host.
  class Host
    # Whether auto-placement is on or off.
    property auto_placement : AutoPlacement | Nil

    # The Availability Zone of the Dedicated Host.
    property availability_zone : String | Nil

    # Information about the instances running on the Dedicated Host.
    property available_capacity : AvailableCapacity | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # The ID of the Dedicated Host.
    property host_id : String | Nil

    # The hardware specifications of the Dedicated Host.
    property host_properties : HostProperties | Nil

    # The reservation ID of the Dedicated Host. This returns a `null` response if the Dedicated Host
    # doesn't have an associated reservation.
    property host_reservation_id : String | Nil

    # The IDs and instance type that are currently running on the Dedicated Host.
    property instances : Array(HostInstance) | Nil

    # The Dedicated Host's state.
    property state : AllocationState | Nil

    # The time that the Dedicated Host was allocated.
    property allocation_time : Time | Nil

    # The time that the Dedicated Host was released.
    property release_time : Time | Nil

    # Any tags assigned to the Dedicated Host.
    property tags : Array(Tag) | Nil

    # Indicates whether host recovery is enabled or disabled for the Dedicated Host.
    property host_recovery : HostRecovery | Nil

    # Indicates whether the Dedicated Host supports multiple instance types of the same instance
    # family. If the value is `on`, the Dedicated Host supports multiple instance types in the
    # instance family. If the value is `off`, the Dedicated Host supports a single instance type only.
    property allows_multiple_instance_types : AllowsMultipleInstanceTypes | Nil

    # The ID of the Amazon Web Services account that owns the Dedicated Host.
    property owner_id : String | Nil

    # The ID of the Availability Zone in which the Dedicated Host is allocated.
    property availability_zone_id : String | Nil

    # Indicates whether the Dedicated Host is in a host resource group. If
    # **memberOfServiceLinkedResourceGroup** is `true`, the host is in a host resource group;
    # otherwise, it is not.
    property member_of_service_linked_resource_group : Bool | Nil

    # The Amazon Resource Name (ARN) of the Amazon Web Services Outpost on which the Dedicated Host is
    # allocated.
    property outpost_arn : String | Nil

    # Indicates whether host maintenance is enabled or disabled for the Dedicated Host.
    property host_maintenance : HostMaintenance | Nil

    # The ID of the Outpost hardware asset on which the Dedicated Host is allocated.
    property asset_id : String | Nil

    # The CPU options for the Dedicated Host, including AMD Secure Encrypted Virtualization-Secure
    # Nested Paging (AMD SEV-SNP) settings.
    property cpu_options : HostCpuOptions | Nil

    def initialize(
      @auto_placement : AutoPlacement | Nil = nil,
      @availability_zone : String | Nil = nil,
      @available_capacity : AvailableCapacity | Nil = nil,
      @client_token : String | Nil = nil,
      @host_id : String | Nil = nil,
      @host_properties : HostProperties | Nil = nil,
      @host_reservation_id : String | Nil = nil,
      @instances : Array(HostInstance) | Nil = nil,
      @state : AllocationState | Nil = nil,
      @allocation_time : Time | Nil = nil,
      @release_time : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @host_recovery : HostRecovery | Nil = nil,
      @allows_multiple_instance_types : AllowsMultipleInstanceTypes | Nil = nil,
      @owner_id : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @member_of_service_linked_resource_group : Bool | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @host_maintenance : HostMaintenance | Nil = nil,
      @asset_id : String | Nil = nil,
      @cpu_options : HostCpuOptions | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @auto_placement
        params << {"#{prefix}AutoPlacement", value.to_json_object_key}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @available_capacity
        params.concat(value.to_query_params("#{prefix}AvailableCapacity."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @host_id
        params << {"#{prefix}HostId", value}
      end

      if value = @host_properties
        params.concat(value.to_query_params("#{prefix}HostProperties."))
      end

      if value = @host_reservation_id
        params << {"#{prefix}HostReservationId", value}
      end

      (@instances || [] of HostInstance).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Instances.#{i}."))
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @allocation_time
        params << {"#{prefix}AllocationTime", Core::QueryValue.time(value)}
      end

      if value = @release_time
        params << {"#{prefix}ReleaseTime", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @host_recovery
        params << {"#{prefix}HostRecovery", value.to_json_object_key}
      end

      if value = @allows_multiple_instance_types
        params << {"#{prefix}AllowsMultipleInstanceTypes", value.to_json_object_key}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @member_of_service_linked_resource_group
        params << {"#{prefix}MemberOfServiceLinkedResourceGroup", Core::QueryValue.bool(value)}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @host_maintenance
        params << {"#{prefix}HostMaintenance", value.to_json_object_key}
      end

      if value = @asset_id
        params << {"#{prefix}AssetId", value}
      end

      if value = @cpu_options
        params.concat(value.to_query_params("#{prefix}CpuOptions."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        auto_placement: (n = node.xpath_node("*[local-name()='autoPlacement']")) ? AEC::AutoPlacement.from_json_object_key?(n.content) : nil,
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        available_capacity: node.xpath_node("*[local-name()='availableCapacity']").try { |n| AvailableCapacity.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
        host_id: Core::XMLValue.string(node.xpath_node("*[local-name()='hostId']")),
        host_properties: node.xpath_node("*[local-name()='hostProperties']").try { |n| HostProperties.from_xml(n) },
        host_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='hostReservationId']")),
        instances: node.xpath_nodes("*[local-name()='instances']/*[local-name()='item']").map { |n| HostInstance.from_xml(n) },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::AllocationState.from_json_object_key?(n.content) : nil,
        allocation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='allocationTime']")),
        release_time: Core::XMLValue.time(node.xpath_node("*[local-name()='releaseTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        host_recovery: (n = node.xpath_node("*[local-name()='hostRecovery']")) ? AEC::HostRecovery.from_json_object_key?(n.content) : nil,
        allows_multiple_instance_types: (n = node.xpath_node("*[local-name()='allowsMultipleInstanceTypes']")) ? AEC::AllowsMultipleInstanceTypes.from_json_object_key?(n.content) : nil,
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        member_of_service_linked_resource_group: Core::XMLValue.bool(node.xpath_node("*[local-name()='memberOfServiceLinkedResourceGroup']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        host_maintenance: (n = node.xpath_node("*[local-name()='hostMaintenance']")) ? AEC::HostMaintenance.from_json_object_key?(n.content) : nil,
        asset_id: Core::XMLValue.string(node.xpath_node("*[local-name()='assetId']")),
        cpu_options: node.xpath_node("*[local-name()='cpuOptions']").try { |n| HostCpuOptions.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @available_capacity
        value.validate!
      end

      if value = @host_properties
        value.validate!
      end

      if value = @instances
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @cpu_options
        value.validate!
      end
    end

    def_equals_and_hash(@auto_placement, @availability_zone, @available_capacity, @client_token, @host_id, @host_properties, @host_reservation_id, @instances, @state, @allocation_time, @release_time, @tags, @host_recovery, @allows_multiple_instance_types, @owner_id, @availability_zone_id, @member_of_service_linked_resource_group, @outpost_arn, @host_maintenance, @asset_id, @cpu_options)
  end
end
