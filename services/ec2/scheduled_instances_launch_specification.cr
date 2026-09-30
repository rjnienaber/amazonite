private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the launch specification for a Scheduled Instance.
  #
  # If you are launching the Scheduled Instance in EC2-VPC, you must specify the ID of the subnet.
  # You can specify the subnet using either `SubnetId` or `NetworkInterface`.
  class ScheduledInstancesLaunchSpecification
    # The block device mapping entries.
    property block_device_mappings : Array(ScheduledInstancesBlockDeviceMapping) | Nil

    # Indicates whether the instances are optimized for EBS I/O. This optimization provides dedicated
    # throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O
    # performance. This optimization isn't available with all instance types. Additional usage charges
    # apply when using an EBS-optimized instance.
    #
    # Default: `false`
    property ebs_optimized : Bool | Nil

    # The IAM instance profile.
    property iam_instance_profile : ScheduledInstancesIamInstanceProfile | Nil

    # The ID of the Amazon Machine Image (AMI).
    property image_id : String

    # The instance type.
    property instance_type : String | Nil

    # The ID of the kernel.
    property kernel_id : String | Nil

    # The name of the key pair.
    property key_name : String | Nil

    # Enable or disable monitoring for the instances.
    property monitoring : ScheduledInstancesMonitoring | Nil

    # The network interfaces.
    property network_interfaces : Array(ScheduledInstancesNetworkInterface) | Nil

    # The placement information.
    property placement : ScheduledInstancesPlacement | Nil

    # The ID of the RAM disk.
    property ramdisk_id : String | Nil

    # The IDs of the security groups.
    property security_group_ids : Array(String) | Nil

    # The ID of the subnet in which to launch the instances.
    property subnet_id : String | Nil

    # The base64-encoded MIME user data.
    property user_data : String | Nil

    def initialize(
      @image_id : String,
      @block_device_mappings : Array(ScheduledInstancesBlockDeviceMapping) | Nil = nil,
      @ebs_optimized : Bool | Nil = nil,
      @iam_instance_profile : ScheduledInstancesIamInstanceProfile | Nil = nil,
      @instance_type : String | Nil = nil,
      @kernel_id : String | Nil = nil,
      @key_name : String | Nil = nil,
      @monitoring : ScheduledInstancesMonitoring | Nil = nil,
      @network_interfaces : Array(ScheduledInstancesNetworkInterface) | Nil = nil,
      @placement : ScheduledInstancesPlacement | Nil = nil,
      @ramdisk_id : String | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @subnet_id : String | Nil = nil,
      @user_data : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@block_device_mappings || [] of ScheduledInstancesBlockDeviceMapping).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMapping.#{i}."))
      end

      if value = @ebs_optimized
        params << {"#{prefix}EbsOptimized", Core::QueryValue.bool(value)}
      end

      if value = @iam_instance_profile
        params.concat(value.to_query_params("#{prefix}IamInstanceProfile."))
      end

      params << {"#{prefix}ImageId", @image_id}

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @kernel_id
        params << {"#{prefix}KernelId", value}
      end

      if value = @key_name
        params << {"#{prefix}KeyName", value}
      end

      if value = @monitoring
        params.concat(value.to_query_params("#{prefix}Monitoring."))
      end

      (@network_interfaces || [] of ScheduledInstancesNetworkInterface).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NetworkInterface.#{i}."))
      end

      if value = @placement
        params.concat(value.to_query_params("#{prefix}Placement."))
      end

      if value = @ramdisk_id
        params << {"#{prefix}RamdiskId", value}
      end

      (@security_group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupId.#{i}", item}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @user_data
        params << {"#{prefix}UserData", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        block_device_mappings: node.xpath_nodes("*[local-name()='BlockDeviceMapping']/*[local-name()='BlockDeviceMapping']").map { |n| ScheduledInstancesBlockDeviceMapping.from_xml(n) },
        ebs_optimized: Core::XMLValue.bool(node.xpath_node("*[local-name()='EbsOptimized']")),
        iam_instance_profile: node.xpath_node("*[local-name()='IamInstanceProfile']").try { |n| ScheduledInstancesIamInstanceProfile.from_xml(n) },
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceType']")),
        kernel_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KernelId']")),
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='KeyName']")),
        monitoring: node.xpath_node("*[local-name()='Monitoring']").try { |n| ScheduledInstancesMonitoring.from_xml(n) },
        network_interfaces: node.xpath_nodes("*[local-name()='NetworkInterface']/*[local-name()='NetworkInterface']").map { |n| ScheduledInstancesNetworkInterface.from_xml(n) },
        placement: node.xpath_node("*[local-name()='Placement']").try { |n| ScheduledInstancesPlacement.from_xml(n) },
        ramdisk_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RamdiskId']")),
        security_group_ids: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='SecurityGroupId']").map { |n| n.content },
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetId']")),
        user_data: Core::XMLValue.string(node.xpath_node("*[local-name()='UserData']")),
      )
    end

    def validate! : Nil
      if value = @block_device_mappings
        value.each(&.validate!)
      end

      if value = @iam_instance_profile
        value.validate!
      end

      if value = @monitoring
        value.validate!
      end

      if value = @network_interfaces
        value.each(&.validate!)
      end

      if value = @placement
        value.validate!
      end
    end

    def_equals_and_hash(@block_device_mappings, @ebs_optimized, @iam_instance_profile, @image_id, @instance_type, @kernel_id, @key_name, @monitoring, @network_interfaces, @placement, @ramdisk_id, @security_group_ids, @subnet_id, @user_data)
  end
end
