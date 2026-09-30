private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an instance attribute.
  class InstanceAttribute
    # The block device mapping of the instance.
    property block_device_mappings : Array(InstanceBlockDeviceMapping) | Nil

    # Indicates whether termination protection is enabled. If the value is `true`, you can't terminate
    # the instance using the Amazon EC2 console, command line tools, or API.
    property disable_api_termination : AttributeBooleanValue | Nil

    # Indicates whether enhanced networking with ENA is enabled.
    property ena_support : AttributeBooleanValue | Nil

    # Indicates whether the instance is enabled for Amazon Web Services Nitro Enclaves.
    property enclave_options : EnclaveOptions | Nil

    # Indicates whether the instance is optimized for Amazon EBS I/O.
    property ebs_optimized : AttributeBooleanValue | Nil

    # The ID of the instance.
    property instance_id : String | Nil

    # Indicates whether an instance stops or terminates when you initiate shutdown from the instance
    # (using the operating system command for system shutdown).
    property instance_initiated_shutdown_behavior : AttributeValue | Nil

    # The instance type.
    property instance_type : AttributeValue | Nil

    # The kernel ID.
    property kernel_id : AttributeValue | Nil

    # The product codes.
    property product_codes : Array(ProductCode) | Nil

    # The RAM disk ID.
    property ramdisk_id : AttributeValue | Nil

    # The device name of the root device volume (for example, `/dev/sda1`).
    property root_device_name : AttributeValue | Nil

    # Indicates whether source/destination checks are enabled.
    property source_dest_check : AttributeBooleanValue | Nil

    # Indicates whether enhanced networking with the Intel 82599 Virtual Function interface is
    # enabled.
    property sriov_net_support : AttributeValue | Nil

    # The user data.
    property user_data : AttributeValue | Nil

    # Indicates whether stop protection is enabled for the instance.
    property disable_api_stop : AttributeBooleanValue | Nil

    # The security groups associated with the instance.
    property groups : Array(GroupIdentifier) | Nil

    def initialize(
      @block_device_mappings : Array(InstanceBlockDeviceMapping) | Nil = nil,
      @disable_api_termination : AttributeBooleanValue | Nil = nil,
      @ena_support : AttributeBooleanValue | Nil = nil,
      @enclave_options : EnclaveOptions | Nil = nil,
      @ebs_optimized : AttributeBooleanValue | Nil = nil,
      @instance_id : String | Nil = nil,
      @instance_initiated_shutdown_behavior : AttributeValue | Nil = nil,
      @instance_type : AttributeValue | Nil = nil,
      @kernel_id : AttributeValue | Nil = nil,
      @product_codes : Array(ProductCode) | Nil = nil,
      @ramdisk_id : AttributeValue | Nil = nil,
      @root_device_name : AttributeValue | Nil = nil,
      @source_dest_check : AttributeBooleanValue | Nil = nil,
      @sriov_net_support : AttributeValue | Nil = nil,
      @user_data : AttributeValue | Nil = nil,
      @disable_api_stop : AttributeBooleanValue | Nil = nil,
      @groups : Array(GroupIdentifier) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@block_device_mappings || [] of InstanceBlockDeviceMapping).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMapping.#{i}."))
      end

      if value = @disable_api_termination
        params.concat(value.to_query_params("#{prefix}DisableApiTermination."))
      end

      if value = @ena_support
        params.concat(value.to_query_params("#{prefix}EnaSupport."))
      end

      if value = @enclave_options
        params.concat(value.to_query_params("#{prefix}EnclaveOptions."))
      end

      if value = @ebs_optimized
        params.concat(value.to_query_params("#{prefix}EbsOptimized."))
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @instance_initiated_shutdown_behavior
        params.concat(value.to_query_params("#{prefix}InstanceInitiatedShutdownBehavior."))
      end

      if value = @instance_type
        params.concat(value.to_query_params("#{prefix}InstanceType."))
      end

      if value = @kernel_id
        params.concat(value.to_query_params("#{prefix}Kernel."))
      end

      (@product_codes || [] of ProductCode).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ProductCodes.#{i}."))
      end

      if value = @ramdisk_id
        params.concat(value.to_query_params("#{prefix}Ramdisk."))
      end

      if value = @root_device_name
        params.concat(value.to_query_params("#{prefix}RootDeviceName."))
      end

      if value = @source_dest_check
        params.concat(value.to_query_params("#{prefix}SourceDestCheck."))
      end

      if value = @sriov_net_support
        params.concat(value.to_query_params("#{prefix}SriovNetSupport."))
      end

      if value = @user_data
        params.concat(value.to_query_params("#{prefix}UserData."))
      end

      if value = @disable_api_stop
        params.concat(value.to_query_params("#{prefix}DisableApiStop."))
      end

      (@groups || [] of GroupIdentifier).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GroupSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        block_device_mappings: node.xpath_nodes("*[local-name()='blockDeviceMapping']/*[local-name()='item']").map { |n| InstanceBlockDeviceMapping.from_xml(n) },
        disable_api_termination: node.xpath_node("*[local-name()='disableApiTermination']").try { |n| AttributeBooleanValue.from_xml(n) },
        ena_support: node.xpath_node("*[local-name()='enaSupport']").try { |n| AttributeBooleanValue.from_xml(n) },
        enclave_options: node.xpath_node("*[local-name()='enclaveOptions']").try { |n| EnclaveOptions.from_xml(n) },
        ebs_optimized: node.xpath_node("*[local-name()='ebsOptimized']").try { |n| AttributeBooleanValue.from_xml(n) },
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        instance_initiated_shutdown_behavior: node.xpath_node("*[local-name()='instanceInitiatedShutdownBehavior']").try { |n| AttributeValue.from_xml(n) },
        instance_type: node.xpath_node("*[local-name()='instanceType']").try { |n| AttributeValue.from_xml(n) },
        kernel_id: node.xpath_node("*[local-name()='kernel']").try { |n| AttributeValue.from_xml(n) },
        product_codes: node.xpath_nodes("*[local-name()='productCodes']/*[local-name()='item']").map { |n| ProductCode.from_xml(n) },
        ramdisk_id: node.xpath_node("*[local-name()='ramdisk']").try { |n| AttributeValue.from_xml(n) },
        root_device_name: node.xpath_node("*[local-name()='rootDeviceName']").try { |n| AttributeValue.from_xml(n) },
        source_dest_check: node.xpath_node("*[local-name()='sourceDestCheck']").try { |n| AttributeBooleanValue.from_xml(n) },
        sriov_net_support: node.xpath_node("*[local-name()='sriovNetSupport']").try { |n| AttributeValue.from_xml(n) },
        user_data: node.xpath_node("*[local-name()='userData']").try { |n| AttributeValue.from_xml(n) },
        disable_api_stop: node.xpath_node("*[local-name()='disableApiStop']").try { |n| AttributeBooleanValue.from_xml(n) },
        groups: node.xpath_nodes("*[local-name()='groupSet']/*[local-name()='item']").map { |n| GroupIdentifier.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @block_device_mappings
        value.each(&.validate!)
      end

      if value = @disable_api_termination
        value.validate!
      end

      if value = @ena_support
        value.validate!
      end

      if value = @enclave_options
        value.validate!
      end

      if value = @ebs_optimized
        value.validate!
      end

      if value = @instance_initiated_shutdown_behavior
        value.validate!
      end

      if value = @instance_type
        value.validate!
      end

      if value = @kernel_id
        value.validate!
      end

      if value = @product_codes
        value.each(&.validate!)
      end

      if value = @ramdisk_id
        value.validate!
      end

      if value = @root_device_name
        value.validate!
      end

      if value = @source_dest_check
        value.validate!
      end

      if value = @sriov_net_support
        value.validate!
      end

      if value = @user_data
        value.validate!
      end

      if value = @disable_api_stop
        value.validate!
      end

      if value = @groups
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@block_device_mappings, @disable_api_termination, @ena_support, @enclave_options, @ebs_optimized, @instance_id, @instance_initiated_shutdown_behavior, @instance_type, @kernel_id, @product_codes, @ramdisk_id, @root_device_name, @source_dest_check, @sriov_net_support, @user_data, @disable_api_stop, @groups)
  end
end
