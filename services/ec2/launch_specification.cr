private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the launch specification for an instance.
  class LaunchSpecification
    # The base64-encoded user data that instances use when starting up. User data is limited to 16 KB.
    property user_data : String | Nil

    # Deprecated.
    property addressing_type : String | Nil

    # The block device mapping entries.
    property block_device_mappings : Array(BlockDeviceMapping) | Nil

    # Indicates whether the instance is optimized for EBS I/O. This optimization provides dedicated
    # throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O
    # performance. This optimization isn't available with all instance types. Additional usage charges
    # apply when using an EBS Optimized instance.
    #
    # Default: `false`
    property ebs_optimized : Bool | Nil

    # The IAM instance profile.
    property iam_instance_profile : IamInstanceProfileSpecification | Nil

    # The ID of the AMI.
    property image_id : String | Nil

    # The instance type. Only one instance type can be specified.
    property instance_type : InstanceType | Nil

    # The ID of the kernel.
    property kernel_id : String | Nil

    # The name of the key pair.
    property key_name : String | Nil

    # The network interfaces. If you specify a network interface, you must specify subnet IDs and
    # security group IDs using the network interface.
    property network_interfaces : Array(InstanceNetworkInterfaceSpecification) | Nil

    # The placement information for the instance.
    property placement : SpotPlacement | Nil

    # The ID of the RAM disk.
    property ramdisk_id : String | Nil

    # The ID of the subnet in which to launch the instance.
    property subnet_id : String | Nil

    # The IDs of the security groups.
    property security_groups : Array(GroupIdentifier) | Nil

    property monitoring : RunInstancesMonitoringEnabled | Nil

    def initialize(
      @user_data : String | Nil = nil,
      @addressing_type : String | Nil = nil,
      @block_device_mappings : Array(BlockDeviceMapping) | Nil = nil,
      @ebs_optimized : Bool | Nil = nil,
      @iam_instance_profile : IamInstanceProfileSpecification | Nil = nil,
      @image_id : String | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @kernel_id : String | Nil = nil,
      @key_name : String | Nil = nil,
      @network_interfaces : Array(InstanceNetworkInterfaceSpecification) | Nil = nil,
      @placement : SpotPlacement | Nil = nil,
      @ramdisk_id : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @security_groups : Array(GroupIdentifier) | Nil = nil,
      @monitoring : RunInstancesMonitoringEnabled | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_data
        params << {"#{prefix}UserData", value}
      end

      if value = @addressing_type
        params << {"#{prefix}AddressingType", value}
      end

      (@block_device_mappings || [] of BlockDeviceMapping).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMapping.#{i}."))
      end

      if value = @ebs_optimized
        params << {"#{prefix}EbsOptimized", Core::QueryValue.bool(value)}
      end

      if value = @iam_instance_profile
        params.concat(value.to_query_params("#{prefix}IamInstanceProfile."))
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @kernel_id
        params << {"#{prefix}KernelId", value}
      end

      if value = @key_name
        params << {"#{prefix}KeyName", value}
      end

      (@network_interfaces || [] of InstanceNetworkInterfaceSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NetworkInterfaceSet.#{i}."))
      end

      if value = @placement
        params.concat(value.to_query_params("#{prefix}Placement."))
      end

      if value = @ramdisk_id
        params << {"#{prefix}RamdiskId", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      (@security_groups || [] of GroupIdentifier).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GroupSet.#{i}."))
      end

      if value = @monitoring
        params.concat(value.to_query_params("#{prefix}Monitoring."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_data: Core::XMLValue.string(node.xpath_node("*[local-name()='userData']")),
        addressing_type: Core::XMLValue.string(node.xpath_node("*[local-name()='addressingType']")),
        block_device_mappings: node.xpath_nodes("*[local-name()='blockDeviceMapping']/*[local-name()='item']").map { |n| BlockDeviceMapping.from_xml(n) },
        ebs_optimized: Core::XMLValue.bool(node.xpath_node("*[local-name()='ebsOptimized']")),
        iam_instance_profile: node.xpath_node("*[local-name()='iamInstanceProfile']").try { |n| IamInstanceProfileSpecification.from_xml(n) },
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        kernel_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kernelId']")),
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='keyName']")),
        network_interfaces: node.xpath_nodes("*[local-name()='networkInterfaceSet']/*[local-name()='item']").map { |n| InstanceNetworkInterfaceSpecification.from_xml(n) },
        placement: node.xpath_node("*[local-name()='placement']").try { |n| SpotPlacement.from_xml(n) },
        ramdisk_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ramdiskId']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        security_groups: node.xpath_nodes("*[local-name()='groupSet']/*[local-name()='item']").map { |n| GroupIdentifier.from_xml(n) },
        monitoring: node.xpath_node("*[local-name()='monitoring']").try { |n| RunInstancesMonitoringEnabled.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @block_device_mappings
        value.each(&.validate!)
      end

      if value = @iam_instance_profile
        value.validate!
      end

      if value = @network_interfaces
        value.each(&.validate!)
      end

      if value = @placement
        value.validate!
      end

      if value = @security_groups
        value.each(&.validate!)
      end

      if value = @monitoring
        value.validate!
      end
    end

    def_equals_and_hash(@user_data, @addressing_type, @block_device_mappings, @ebs_optimized, @iam_instance_profile, @image_id, @instance_type, @kernel_id, @key_name, @network_interfaces, @placement, @ramdisk_id, @subnet_id, @security_groups, @monitoring)
  end
end
