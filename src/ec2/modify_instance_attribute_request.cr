private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceAttributeRequest
    # Enable or disable source/destination checks, which ensure that the instance is either the source
    # or the destination of any traffic that it receives. If the value is `true`, source/destination
    # checks are enabled; otherwise, they are disabled. The default value is `true`. You must disable
    # source/destination checks if the instance runs services such as network address translation,
    # routing, or firewalls.
    property source_dest_check : AttributeBooleanValue | Nil

    # Enables or disables the instance for Amazon Web Services Nitro Enclaves. For more information,
    # see the [Amazon Web Services Nitro Enclaves User
    # Guide](https://docs.aws.amazon.com/enclaves/latest/user/nitro-enclave.html).
    property enclave_options : EnclaveOptionsRequest | Nil

    # Indicates whether an instance is enabled for stop protection. For more information, see [Enable
    # stop protection for your
    # instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-stop-protection.html).
    property disable_api_stop : AttributeBooleanValue | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the instance.
    property instance_id : String

    # The name of the attribute to modify.
    #
    # When changing the instance type: If the original instance type is configured for configurable
    # bandwidth, and the desired instance type doesn't support configurable bandwidth, first set the
    # existing bandwidth configuration to `default` using the ModifyInstanceNetworkPerformanceOptions
    # operation.
    #
    # You can modify the following attributes only: `disableApiTermination` | `instanceType` |
    # `kernel` | `ramdisk` | `instanceInitiatedShutdownBehavior` | `blockDeviceMapping` | `userData` |
    # `sourceDestCheck` | `groupSet` | `ebsOptimized` | `sriovNetSupport` | `enaSupport` |
    # `nvmeSupport` | `disableApiStop` | `enclaveOptions`
    property attribute : InstanceAttributeName | Nil

    # A new value for the attribute. Use only with the `kernel`, `ramdisk`, `userData`,
    # `disableApiTermination`, or `instanceInitiatedShutdownBehavior` attribute.
    property value : String | Nil

    # Modifies the `DeleteOnTermination` attribute for volumes that are currently attached. The volume
    # must be owned by the caller. If no value is specified for `DeleteOnTermination`, the default is
    # `true` and the volume is deleted when the instance is terminated. You can't modify the
    # `DeleteOnTermination` attribute for volumes that are attached to Amazon Web Services-managed
    # resources.
    #
    # To add instance store volumes to an Amazon EBS-backed instance, you must add them when you
    # launch the instance. For more information, see [Update the block device mapping when launching
    # an
    # instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html#Using_OverridingAMIBDM)
    # in the *Amazon EC2 User Guide*.
    property block_device_mappings : Array(InstanceBlockDeviceMappingSpecification) | Nil

    # Enable or disable termination protection for the instance. If the value is `true`, you can't
    # terminate the instance using the Amazon EC2 console, command line interface, or API. You can't
    # enable termination protection for Spot Instances.
    property disable_api_termination : AttributeBooleanValue | Nil

    # Changes the instance type to the specified value. For more information, see [Instance
    # types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html) in the *Amazon
    # EC2 User Guide*. If the instance type is not valid, the error returned is
    # `InvalidInstanceAttributeValue`.
    property instance_type : AttributeValue | Nil

    # Changes the instance's kernel to the specified value. We recommend that you use PV-GRUB instead
    # of kernels and RAM disks. For more information, see
    # [PV-GRUB](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedKernels.html).
    property kernel : AttributeValue | Nil

    # Changes the instance's RAM disk to the specified value. We recommend that you use PV-GRUB
    # instead of kernels and RAM disks. For more information, see
    # [PV-GRUB](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedKernels.html).
    property ramdisk : AttributeValue | Nil

    # Changes the instance's user data to the specified value. User data must be base64-encoded.
    # Depending on the tool or SDK that you're using, the base64-encoding might be performed for you.
    # For more information, see [Work with instance user
    # data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-add-user-data.html).
    property user_data : SecureBlobAttributeValue | Nil

    # Specifies whether an instance stops or terminates when you initiate shutdown from the instance
    # (using the operating system command for system shutdown).
    property instance_initiated_shutdown_behavior : AttributeValue | Nil

    # Replaces the security groups of the instance with the specified security groups. You must
    # specify the ID of at least one security group, even if it's just the default security group for
    # the VPC.
    property groups : Array(String) | Nil

    # Specifies whether the instance is optimized for Amazon EBS I/O. This optimization provides
    # dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS
    # I/O performance. This optimization isn't available with all instance types. Additional usage
    # charges apply when using an EBS Optimized instance.
    property ebs_optimized : AttributeBooleanValue | Nil

    # Set to `simple` to enable enhanced networking with the Intel 82599 Virtual Function interface
    # for the instance.
    #
    # There is no way to disable enhanced networking with the Intel 82599 Virtual Function interface
    # at this time.
    #
    # This option is supported only for HVM instances. Specifying this option with a PV instance can
    # make it unreachable.
    property sriov_net_support : AttributeValue | Nil

    # Set to `true` to enable enhanced networking with ENA for the instance.
    #
    # This option is supported only for HVM instances. Specifying this option with a PV instance can
    # make it unreachable.
    property ena_support : AttributeBooleanValue | Nil

    def initialize(
      @instance_id : String,
      @source_dest_check : AttributeBooleanValue | Nil = nil,
      @enclave_options : EnclaveOptionsRequest | Nil = nil,
      @disable_api_stop : AttributeBooleanValue | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @attribute : InstanceAttributeName | Nil = nil,
      @value : String | Nil = nil,
      @block_device_mappings : Array(InstanceBlockDeviceMappingSpecification) | Nil = nil,
      @disable_api_termination : AttributeBooleanValue | Nil = nil,
      @instance_type : AttributeValue | Nil = nil,
      @kernel : AttributeValue | Nil = nil,
      @ramdisk : AttributeValue | Nil = nil,
      @user_data : SecureBlobAttributeValue | Nil = nil,
      @instance_initiated_shutdown_behavior : AttributeValue | Nil = nil,
      @groups : Array(String) | Nil = nil,
      @ebs_optimized : AttributeBooleanValue | Nil = nil,
      @sriov_net_support : AttributeValue | Nil = nil,
      @ena_support : AttributeBooleanValue | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @source_dest_check
        params.concat(value.to_query_params("#{prefix}SourceDestCheck."))
      end

      if value = @enclave_options
        params.concat(value.to_query_params("#{prefix}EnclaveOptions."))
      end

      if value = @disable_api_stop
        params.concat(value.to_query_params("#{prefix}DisableApiStop."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}InstanceId", @instance_id}

      if value = @attribute
        params << {"#{prefix}Attribute", value.to_json_object_key}
      end

      if value = @value
        params << {"#{prefix}Value", value}
      end

      (@block_device_mappings || [] of InstanceBlockDeviceMappingSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMapping.#{i}."))
      end

      if value = @disable_api_termination
        params.concat(value.to_query_params("#{prefix}DisableApiTermination."))
      end

      if value = @instance_type
        params.concat(value.to_query_params("#{prefix}InstanceType."))
      end

      if value = @kernel
        params.concat(value.to_query_params("#{prefix}Kernel."))
      end

      if value = @ramdisk
        params.concat(value.to_query_params("#{prefix}Ramdisk."))
      end

      if value = @user_data
        params.concat(value.to_query_params("#{prefix}UserData."))
      end

      if value = @instance_initiated_shutdown_behavior
        params.concat(value.to_query_params("#{prefix}InstanceInitiatedShutdownBehavior."))
      end

      (@groups || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}GroupId.#{i}", item}
      end

      if value = @ebs_optimized
        params.concat(value.to_query_params("#{prefix}EbsOptimized."))
      end

      if value = @sriov_net_support
        params.concat(value.to_query_params("#{prefix}SriovNetSupport."))
      end

      if value = @ena_support
        params.concat(value.to_query_params("#{prefix}EnaSupport."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_dest_check: node.xpath_node("*[local-name()='SourceDestCheck']").try { |n| AttributeBooleanValue.from_xml(n) },
        enclave_options: node.xpath_node("*[local-name()='EnclaveOptions']").try { |n| EnclaveOptionsRequest.from_xml(n) },
        disable_api_stop: node.xpath_node("*[local-name()='DisableApiStop']").try { |n| AttributeBooleanValue.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")).not_nil!,
        attribute: (n = node.xpath_node("*[local-name()='attribute']")) ? AEC::InstanceAttributeName.from_json_object_key?(n.content) : nil,
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='value']")),
        block_device_mappings: node.xpath_nodes("*[local-name()='blockDeviceMapping']/*[local-name()='item']").map { |n| InstanceBlockDeviceMappingSpecification.from_xml(n) },
        disable_api_termination: node.xpath_node("*[local-name()='disableApiTermination']").try { |n| AttributeBooleanValue.from_xml(n) },
        instance_type: node.xpath_node("*[local-name()='instanceType']").try { |n| AttributeValue.from_xml(n) },
        kernel: node.xpath_node("*[local-name()='kernel']").try { |n| AttributeValue.from_xml(n) },
        ramdisk: node.xpath_node("*[local-name()='ramdisk']").try { |n| AttributeValue.from_xml(n) },
        user_data: node.xpath_node("*[local-name()='userData']").try { |n| SecureBlobAttributeValue.from_xml(n) },
        instance_initiated_shutdown_behavior: node.xpath_node("*[local-name()='instanceInitiatedShutdownBehavior']").try { |n| AttributeValue.from_xml(n) },
        groups: node.xpath_nodes("*[local-name()='GroupId']/*[local-name()='groupId']").map { |n| n.content },
        ebs_optimized: node.xpath_node("*[local-name()='ebsOptimized']").try { |n| AttributeBooleanValue.from_xml(n) },
        sriov_net_support: node.xpath_node("*[local-name()='sriovNetSupport']").try { |n| AttributeValue.from_xml(n) },
        ena_support: node.xpath_node("*[local-name()='enaSupport']").try { |n| AttributeBooleanValue.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @source_dest_check
        value.validate!
      end

      if value = @enclave_options
        value.validate!
      end

      if value = @disable_api_stop
        value.validate!
      end

      if value = @block_device_mappings
        value.each(&.validate!)
      end

      if value = @disable_api_termination
        value.validate!
      end

      if value = @instance_type
        value.validate!
      end

      if value = @kernel
        value.validate!
      end

      if value = @ramdisk
        value.validate!
      end

      if value = @user_data
        value.validate!
      end

      if value = @instance_initiated_shutdown_behavior
        value.validate!
      end

      if value = @ebs_optimized
        value.validate!
      end

      if value = @sriov_net_support
        value.validate!
      end

      if value = @ena_support
        value.validate!
      end
    end

    def_equals_and_hash(@source_dest_check, @enclave_options, @disable_api_stop, @dry_run, @instance_id, @attribute, @value, @block_device_mappings, @disable_api_termination, @instance_type, @kernel, @ramdisk, @user_data, @instance_initiated_shutdown_behavior, @groups, @ebs_optimized, @sriov_net_support, @ena_support)
  end
end
