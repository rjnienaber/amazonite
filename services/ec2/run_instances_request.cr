private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class RunInstancesRequest
    # The block device mapping, which defines the EBS volumes and instance store volumes to attach to
    # the instance at launch. For more information, see [Block device
    # mappings](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html)
    # in the *Amazon EC2 User Guide*.
    property block_device_mappings : Array(BlockDeviceMapping) | Nil

    # The ID of the AMI. An AMI ID is required to launch an instance and must be specified here or in
    # a launch template.
    property image_id : String | Nil

    # The instance type. For more information, see [Amazon EC2 Instance Types
    # Guide](https://docs.aws.amazon.com/ec2/latest/instancetypes/instance-types.html).
    property instance_type : InstanceType | Nil

    # The number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses
    # the IPv6 addresses from the range of your subnet. You cannot specify this option and the option
    # to assign specific IPv6 addresses in the same request. You can specify this option if you've
    # specified a minimum number of instances to launch.
    #
    # You cannot specify this option and the network interfaces option in the same request.
    property ipv_6_address_count : Int32 | Nil

    # The IPv6 addresses from the range of the subnet to associate with the primary network interface.
    # You cannot specify this option and the option to assign a number of IPv6 addresses in the same
    # request. You cannot specify this option if you've specified a minimum number of instances to
    # launch.
    #
    # You cannot specify this option and the network interfaces option in the same request.
    property ipv_6_addresses : Array(InstanceIpv6Address) | Nil

    # The ID of the kernel.
    #
    # We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see
    # [PV-GRUB](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedkernels.html) in the
    # *Amazon EC2 User Guide*.
    property kernel_id : String | Nil

    # The name of the key pair. For more information, see [Create a key pair for your EC2
    # instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-key-pairs.html).
    #
    # If you do not specify a key pair, you can't connect to the instance unless you choose an AMI
    # that is configured to allow users another way to log in.
    property key_name : String | Nil

    # The maximum number of instances to launch. If you specify a value that is more capacity than
    # Amazon EC2 can launch in the target Availability Zone, Amazon EC2 launches the largest possible
    # number of instances above the specified minimum count.
    #
    # Constraints: Between 1 and the quota for the specified instance type for your account for this
    # Region. For more information, see [Amazon EC2 instance type
    # quotas](https://docs.aws.amazon.com/ec2/latest/instancetypes/ec2-instance-quotas.html).
    property max_count : Int32

    # The minimum number of instances to launch. If you specify a value that is more capacity than
    # Amazon EC2 can provide in the target Availability Zone, Amazon EC2 does not launch any
    # instances.
    #
    # Constraints: Between 1 and the quota for the specified instance type for your account for this
    # Region. For more information, see [Amazon EC2 instance type
    # quotas](https://docs.aws.amazon.com/ec2/latest/instancetypes/ec2-instance-quotas.html).
    property min_count : Int32

    # Specifies whether detailed monitoring is enabled for the instance.
    property monitoring : RunInstancesMonitoringEnabled | Nil

    # The placement for the instance.
    property placement : Placement | Nil

    # The ID of the RAM disk to select. Some kernels require additional drivers at launch. Check the
    # kernel requirements for information about whether you need to specify a RAM disk. To find kernel
    # requirements, go to the Amazon Web Services Resource Center and search for the kernel ID.
    #
    # We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see
    # [PV-GRUB](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedkernels.html) in the
    # *Amazon EC2 User Guide*.
    property ramdisk_id : String | Nil

    # The IDs of the security groups.
    #
    # If you specify a network interface, you must specify any security groups as part of the network
    # interface instead of using this parameter.
    property security_group_ids : Array(String) | Nil

    # [Default VPC] The names of the security groups.
    #
    # If you specify a network interface, you must specify any security groups as part of the network
    # interface instead of using this parameter.
    #
    # Default: Amazon EC2 uses the default security group.
    property security_groups : Array(String) | Nil

    # The ID of the subnet to launch the instance into.
    #
    # If you specify a network interface, you must specify any subnets as part of the network
    # interface instead of using this parameter.
    property subnet_id : String | Nil

    # The user data to make available to the instance. User data must be base64-encoded. Depending on
    # the tool or SDK that you're using, the base64-encoding might be performed for you. For more
    # information, see [Run commands at launch using instance user
    # data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html).
    property user_data : String | Nil

    # An elastic GPU to associate with the instance.
    #
    # Amazon Elastic Graphics reached end of life on January 8, 2024.
    property elastic_gpu_specification : Array(ElasticGpuSpecification) | Nil

    # An elastic inference accelerator to associate with the instance.
    #
    # Amazon Elastic Inference is no longer available.
    property elastic_inference_accelerators : Array(ElasticInferenceAccelerator) | Nil

    # The tags to apply to the resources that are created during instance launch.
    #
    # You can specify tags for the following resources only:
    #
    # - Instances
    #
    # - Volumes
    #
    # - Spot Instance requests
    #
    # - Network interfaces
    #
    # To tag a resource after it has been created, see
    # [CreateTags](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTags.html).
    property tag_specifications : Array(TagSpecification) | Nil

    # The launch template. Any additional parameters that you specify for the new instance overwrite
    # the corresponding parameters included in the launch template.
    property launch_template : LaunchTemplateSpecification | Nil

    # The market (purchasing) option for the instances.
    #
    # For RunInstances, persistent Spot Instance requests are only supported when
    # **InstanceInterruptionBehavior** is set to either `hibernate` or `stop`.
    property instance_market_options : InstanceMarketOptionsRequest | Nil

    # The credit option for CPU usage of the burstable performance instance. Valid values are
    # `standard` and `unlimited`. To change this attribute after launch, use [
    # ModifyInstanceCreditSpecification](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyInstanceCreditSpecification.html).
    # For more information, see [Burstable performance
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html)
    # in the *Amazon EC2 User Guide*.
    #
    # Default: `standard` (T2 instances) or `unlimited` (T3/T3a/T4g instances)
    #
    # For T3 instances with `host` tenancy, only `standard` is supported.
    property credit_specification : CreditSpecificationRequest | Nil

    # The CPU options for the instance. For more information, see [Optimize CPU
    # options](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-optimize-cpu.html) in the
    # *Amazon EC2 User Guide*.
    property cpu_options : CpuOptionsRequest | Nil

    # Information about the Capacity Reservation targeting option. If you do not specify this
    # parameter, the instance's Capacity Reservation preference defaults to `open`, which enables it
    # to run in any open Capacity Reservation that has matching attributes (instance type, platform,
    # Availability Zone, and tenancy).
    property capacity_reservation_specification : CapacityReservationSpecification | Nil

    # Indicates whether an instance is enabled for hibernation. This parameter is valid only if the
    # instance meets the [hibernation
    # prerequisites](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/hibernating-prerequisites.html).
    # For more information, see [Hibernate your Amazon EC2
    # instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html) in the *Amazon EC2
    # User Guide*.
    #
    # You can't enable hibernation and Amazon Web Services Nitro Enclaves on the same instance.
    property hibernation_options : HibernationOptionsRequest | Nil

    # The license configurations.
    property license_specifications : Array(LicenseConfigurationRequest) | Nil

    # The metadata options for the instance. For more information, see [Configure the Instance
    # Metadata Service
    # options](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-options.html).
    property metadata_options : InstanceMetadataOptionsRequest | Nil

    # Indicates whether the instance is enabled for Amazon Web Services Nitro Enclaves. For more
    # information, see [Amazon Web Services Nitro Enclaves User
    # Guide](https://docs.aws.amazon.com/enclaves/latest/user/).
    #
    # You can't enable Amazon Web Services Nitro Enclaves and hibernation on the same instance.
    property enclave_options : EnclaveOptionsRequest | Nil

    # The options for the instance hostname. The default values are inherited from the subnet. Applies
    # only if creating a network interface, not attaching an existing one.
    property private_dns_name_options : PrivateDnsNameOptionsRequest | Nil

    # The maintenance and recovery options for the instance.
    property maintenance_options : InstanceMaintenanceOptionsRequest | Nil

    # Indicates whether an instance is enabled for stop protection. For more information, see [Enable
    # stop protection for your EC2
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-stop-protection.html).
    property disable_api_stop : Bool | Nil

    # If you’re launching an instance into a dual-stack or IPv6-only subnet, you can enable assigning
    # a primary IPv6 address. A primary IPv6 address is an IPv6 GUA address associated with an ENI
    # that you have enabled to use a primary IPv6 address. Use this option if an instance relies on
    # its IPv6 address not changing. When you launch the instance, Amazon Web Services will
    # automatically assign an IPv6 address associated with the ENI attached to your instance to be the
    # primary IPv6 address. Once you enable an IPv6 GUA address to be a primary IPv6, you cannot
    # disable it. When you enable an IPv6 GUA address to be a primary IPv6, the first IPv6 GUA will be
    # made the primary IPv6 address until the instance is terminated or the network interface is
    # detached. If you have multiple IPv6 addresses associated with an ENI attached to your instance
    # and you enable a primary IPv6 address, the first IPv6 GUA address associated with the ENI
    # becomes the primary IPv6 address.
    property enable_primary_ipv_6 : Bool | Nil

    # Contains settings for the network performance options for the instance.
    property network_performance_options : InstanceNetworkPerformanceOptionsRequest | Nil

    # Reserved for internal use.
    property operator : OperatorRequest | Nil

    # The secondary interfaces to associate with the instance.
    property secondary_interfaces : Array(InstanceSecondaryInterfaceSpecificationRequest) | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Indicates whether termination protection is enabled for the instance. The default is `false`,
    # which means that you can terminate the instance using the Amazon EC2 console, command line
    # tools, or API. You can enable termination protection when you launch an instance, while the
    # instance is running, or while the instance is stopped.
    property disable_api_termination : Bool | Nil

    # Indicates whether an instance stops or terminates when you initiate shutdown from the instance
    # (using the operating system command for system shutdown).
    #
    # Default: `stop`
    property instance_initiated_shutdown_behavior : ShutdownBehavior | Nil

    # The primary IPv4 address. You must specify a value from the IPv4 address range of the subnet.
    #
    # Only one private IP address can be designated as primary. You can't specify this option if
    # you've specified the option to designate a private IP address as the primary IP address in a
    # network interface specification. You cannot specify this option if you're launching more than
    # one instance in the request.
    #
    # You cannot specify this option and the network interfaces option in the same request.
    property private_ip_address : String | Nil

    # Unique, case-sensitive identifier you provide to ensure the idempotency of the request. If you
    # do not specify a client token, a randomly generated token is used for the request to ensure
    # idempotency.
    #
    # For more information, see [Ensuring idempotency in Amazon EC2 API
    # requests](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    #
    # Constraints: Maximum 64 ASCII characters
    property client_token : String | Nil

    # Reserved.
    property additional_info : String | Nil

    # The network interfaces to associate with the instance.
    property network_interfaces : Array(InstanceNetworkInterfaceSpecification) | Nil

    # The name or Amazon Resource Name (ARN) of an IAM instance profile.
    property iam_instance_profile : IamInstanceProfileSpecification | Nil

    # Indicates whether the instance is optimized for Amazon EBS I/O. This optimization provides
    # dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal
    # Amazon EBS I/O performance. This optimization isn't available with all instance types.
    # Additional usage charges apply when using an EBS-optimized instance.
    #
    # Default: `false`
    property ebs_optimized : Bool | Nil

    def initialize(
      @max_count : Int32,
      @min_count : Int32,
      @block_device_mappings : Array(BlockDeviceMapping) | Nil = nil,
      @image_id : String | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @ipv_6_address_count : Int32 | Nil = nil,
      @ipv_6_addresses : Array(InstanceIpv6Address) | Nil = nil,
      @kernel_id : String | Nil = nil,
      @key_name : String | Nil = nil,
      @monitoring : RunInstancesMonitoringEnabled | Nil = nil,
      @placement : Placement | Nil = nil,
      @ramdisk_id : String | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @security_groups : Array(String) | Nil = nil,
      @subnet_id : String | Nil = nil,
      @user_data : String | Nil = nil,
      @elastic_gpu_specification : Array(ElasticGpuSpecification) | Nil = nil,
      @elastic_inference_accelerators : Array(ElasticInferenceAccelerator) | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @launch_template : LaunchTemplateSpecification | Nil = nil,
      @instance_market_options : InstanceMarketOptionsRequest | Nil = nil,
      @credit_specification : CreditSpecificationRequest | Nil = nil,
      @cpu_options : CpuOptionsRequest | Nil = nil,
      @capacity_reservation_specification : CapacityReservationSpecification | Nil = nil,
      @hibernation_options : HibernationOptionsRequest | Nil = nil,
      @license_specifications : Array(LicenseConfigurationRequest) | Nil = nil,
      @metadata_options : InstanceMetadataOptionsRequest | Nil = nil,
      @enclave_options : EnclaveOptionsRequest | Nil = nil,
      @private_dns_name_options : PrivateDnsNameOptionsRequest | Nil = nil,
      @maintenance_options : InstanceMaintenanceOptionsRequest | Nil = nil,
      @disable_api_stop : Bool | Nil = nil,
      @enable_primary_ipv_6 : Bool | Nil = nil,
      @network_performance_options : InstanceNetworkPerformanceOptionsRequest | Nil = nil,
      @operator : OperatorRequest | Nil = nil,
      @secondary_interfaces : Array(InstanceSecondaryInterfaceSpecificationRequest) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @disable_api_termination : Bool | Nil = nil,
      @instance_initiated_shutdown_behavior : ShutdownBehavior | Nil = nil,
      @private_ip_address : String | Nil = nil,
      @client_token : String | Nil = nil,
      @additional_info : String | Nil = nil,
      @network_interfaces : Array(InstanceNetworkInterfaceSpecification) | Nil = nil,
      @iam_instance_profile : IamInstanceProfileSpecification | Nil = nil,
      @ebs_optimized : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@block_device_mappings || [] of BlockDeviceMapping).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMapping.#{i}."))
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @ipv_6_address_count
        params << {"#{prefix}Ipv6AddressCount", value.to_s}
      end

      (@ipv_6_addresses || [] of InstanceIpv6Address).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6Address.#{i}."))
      end

      if value = @kernel_id
        params << {"#{prefix}KernelId", value}
      end

      if value = @key_name
        params << {"#{prefix}KeyName", value}
      end

      params << {"#{prefix}MaxCount", @max_count.to_s}

      params << {"#{prefix}MinCount", @min_count.to_s}

      if value = @monitoring
        params.concat(value.to_query_params("#{prefix}Monitoring."))
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

      (@security_groups || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroup.#{i}", item}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @user_data
        params << {"#{prefix}UserData", value}
      end

      (@elastic_gpu_specification || [] of ElasticGpuSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ElasticGpuSpecification.#{i}."))
      end

      (@elastic_inference_accelerators || [] of ElasticInferenceAccelerator).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ElasticInferenceAccelerator.#{i}."))
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @launch_template
        params.concat(value.to_query_params("#{prefix}LaunchTemplate."))
      end

      if value = @instance_market_options
        params.concat(value.to_query_params("#{prefix}InstanceMarketOptions."))
      end

      if value = @credit_specification
        params.concat(value.to_query_params("#{prefix}CreditSpecification."))
      end

      if value = @cpu_options
        params.concat(value.to_query_params("#{prefix}CpuOptions."))
      end

      if value = @capacity_reservation_specification
        params.concat(value.to_query_params("#{prefix}CapacityReservationSpecification."))
      end

      if value = @hibernation_options
        params.concat(value.to_query_params("#{prefix}HibernationOptions."))
      end

      (@license_specifications || [] of LicenseConfigurationRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LicenseSpecification.#{i}."))
      end

      if value = @metadata_options
        params.concat(value.to_query_params("#{prefix}MetadataOptions."))
      end

      if value = @enclave_options
        params.concat(value.to_query_params("#{prefix}EnclaveOptions."))
      end

      if value = @private_dns_name_options
        params.concat(value.to_query_params("#{prefix}PrivateDnsNameOptions."))
      end

      if value = @maintenance_options
        params.concat(value.to_query_params("#{prefix}MaintenanceOptions."))
      end

      if value = @disable_api_stop
        params << {"#{prefix}DisableApiStop", Core::QueryValue.bool(value)}
      end

      if value = @enable_primary_ipv_6
        params << {"#{prefix}EnablePrimaryIpv6", Core::QueryValue.bool(value)}
      end

      if value = @network_performance_options
        params.concat(value.to_query_params("#{prefix}NetworkPerformanceOptions."))
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end

      (@secondary_interfaces || [] of InstanceSecondaryInterfaceSpecificationRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecondaryInterface.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @disable_api_termination
        params << {"#{prefix}DisableApiTermination", Core::QueryValue.bool(value)}
      end

      if value = @instance_initiated_shutdown_behavior
        params << {"#{prefix}InstanceInitiatedShutdownBehavior", value.to_json_object_key}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @additional_info
        params << {"#{prefix}AdditionalInfo", value}
      end

      (@network_interfaces || [] of InstanceNetworkInterfaceSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NetworkInterface.#{i}."))
      end

      if value = @iam_instance_profile
        params.concat(value.to_query_params("#{prefix}IamInstanceProfile."))
      end

      if value = @ebs_optimized
        params << {"#{prefix}EbsOptimized", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        block_device_mappings: node.xpath_nodes("*[local-name()='BlockDeviceMapping']/*[local-name()='BlockDeviceMapping']").map { |n| BlockDeviceMapping.from_xml(n) },
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")),
        instance_type: (n = node.xpath_node("*[local-name()='InstanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        ipv_6_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv6AddressCount']")),
        ipv_6_addresses: node.xpath_nodes("*[local-name()='Ipv6Address']/*[local-name()='item']").map { |n| InstanceIpv6Address.from_xml(n) },
        kernel_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KernelId']")),
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='KeyName']")),
        max_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxCount']")).not_nil!,
        min_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='MinCount']")).not_nil!,
        monitoring: node.xpath_node("*[local-name()='Monitoring']").try { |n| RunInstancesMonitoringEnabled.from_xml(n) },
        placement: node.xpath_node("*[local-name()='Placement']").try { |n| Placement.from_xml(n) },
        ramdisk_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RamdiskId']")),
        security_group_ids: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='SecurityGroupId']").map { |n| n.content },
        security_groups: node.xpath_nodes("*[local-name()='SecurityGroup']/*[local-name()='SecurityGroup']").map { |n| n.content },
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetId']")),
        user_data: Core::XMLValue.string(node.xpath_node("*[local-name()='UserData']")),
        elastic_gpu_specification: node.xpath_nodes("*[local-name()='ElasticGpuSpecification']/*[local-name()='item']").map { |n| ElasticGpuSpecification.from_xml(n) },
        elastic_inference_accelerators: node.xpath_nodes("*[local-name()='ElasticInferenceAccelerator']/*[local-name()='item']").map { |n| ElasticInferenceAccelerator.from_xml(n) },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        launch_template: node.xpath_node("*[local-name()='LaunchTemplate']").try { |n| LaunchTemplateSpecification.from_xml(n) },
        instance_market_options: node.xpath_node("*[local-name()='InstanceMarketOptions']").try { |n| InstanceMarketOptionsRequest.from_xml(n) },
        credit_specification: node.xpath_node("*[local-name()='CreditSpecification']").try { |n| CreditSpecificationRequest.from_xml(n) },
        cpu_options: node.xpath_node("*[local-name()='CpuOptions']").try { |n| CpuOptionsRequest.from_xml(n) },
        capacity_reservation_specification: node.xpath_node("*[local-name()='CapacityReservationSpecification']").try { |n| CapacityReservationSpecification.from_xml(n) },
        hibernation_options: node.xpath_node("*[local-name()='HibernationOptions']").try { |n| HibernationOptionsRequest.from_xml(n) },
        license_specifications: node.xpath_nodes("*[local-name()='LicenseSpecification']/*[local-name()='item']").map { |n| LicenseConfigurationRequest.from_xml(n) },
        metadata_options: node.xpath_node("*[local-name()='MetadataOptions']").try { |n| InstanceMetadataOptionsRequest.from_xml(n) },
        enclave_options: node.xpath_node("*[local-name()='EnclaveOptions']").try { |n| EnclaveOptionsRequest.from_xml(n) },
        private_dns_name_options: node.xpath_node("*[local-name()='PrivateDnsNameOptions']").try { |n| PrivateDnsNameOptionsRequest.from_xml(n) },
        maintenance_options: node.xpath_node("*[local-name()='MaintenanceOptions']").try { |n| InstanceMaintenanceOptionsRequest.from_xml(n) },
        disable_api_stop: Core::XMLValue.bool(node.xpath_node("*[local-name()='DisableApiStop']")),
        enable_primary_ipv_6: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnablePrimaryIpv6']")),
        network_performance_options: node.xpath_node("*[local-name()='NetworkPerformanceOptions']").try { |n| InstanceNetworkPerformanceOptionsRequest.from_xml(n) },
        operator: node.xpath_node("*[local-name()='Operator']").try { |n| OperatorRequest.from_xml(n) },
        secondary_interfaces: node.xpath_nodes("*[local-name()='SecondaryInterface']/*[local-name()='item']").map { |n| InstanceSecondaryInterfaceSpecificationRequest.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        disable_api_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='disableApiTermination']")),
        instance_initiated_shutdown_behavior: (n = node.xpath_node("*[local-name()='instanceInitiatedShutdownBehavior']")) ? AEC::ShutdownBehavior.from_json_object_key?(n.content) : nil,
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='privateIpAddress']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
        additional_info: Core::XMLValue.string(node.xpath_node("*[local-name()='additionalInfo']")),
        network_interfaces: node.xpath_nodes("*[local-name()='networkInterface']/*[local-name()='item']").map { |n| InstanceNetworkInterfaceSpecification.from_xml(n) },
        iam_instance_profile: node.xpath_node("*[local-name()='iamInstanceProfile']").try { |n| IamInstanceProfileSpecification.from_xml(n) },
        ebs_optimized: Core::XMLValue.bool(node.xpath_node("*[local-name()='ebsOptimized']")),
      )
    end

    def validate! : Nil
      if value = @block_device_mappings
        value.each(&.validate!)
      end

      if value = @ipv_6_addresses
        value.each(&.validate!)
      end

      if value = @monitoring
        value.validate!
      end

      if value = @placement
        value.validate!
      end

      if value = @elastic_gpu_specification
        value.each(&.validate!)
      end

      if value = @elastic_inference_accelerators
        value.each(&.validate!)
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @launch_template
        value.validate!
      end

      if value = @instance_market_options
        value.validate!
      end

      if value = @credit_specification
        value.validate!
      end

      if value = @cpu_options
        value.validate!
      end

      if value = @capacity_reservation_specification
        value.validate!
      end

      if value = @hibernation_options
        value.validate!
      end

      if value = @license_specifications
        value.each(&.validate!)
      end

      if value = @metadata_options
        value.validate!
      end

      if value = @enclave_options
        value.validate!
      end

      if value = @private_dns_name_options
        value.validate!
      end

      if value = @maintenance_options
        value.validate!
      end

      if value = @network_performance_options
        value.validate!
      end

      if value = @operator
        value.validate!
      end

      if value = @secondary_interfaces
        value.each(&.validate!)
      end

      if value = @network_interfaces
        value.each(&.validate!)
      end

      if value = @iam_instance_profile
        value.validate!
      end
    end

    def_equals_and_hash(@block_device_mappings, @image_id, @instance_type, @ipv_6_address_count, @ipv_6_addresses, @kernel_id, @key_name, @max_count, @min_count, @monitoring, @placement, @ramdisk_id, @security_group_ids, @security_groups, @subnet_id, @user_data, @elastic_gpu_specification, @elastic_inference_accelerators, @tag_specifications, @launch_template, @instance_market_options, @credit_specification, @cpu_options, @capacity_reservation_specification, @hibernation_options, @license_specifications, @metadata_options, @enclave_options, @private_dns_name_options, @maintenance_options, @disable_api_stop, @enable_primary_ipv_6, @network_performance_options, @operator, @secondary_interfaces, @dry_run, @disable_api_termination, @instance_initiated_shutdown_behavior, @private_ip_address, @client_token, @additional_info, @network_interfaces, @iam_instance_profile, @ebs_optimized)
  end
end
