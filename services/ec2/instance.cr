private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an instance.
  class Instance
    # The architecture of the image.
    property architecture : ArchitectureValues | Nil

    # Any block device mapping entries for the instance.
    property block_device_mappings : Array(InstanceBlockDeviceMapping) | Nil

    # The idempotency token you provided when you launched the instance, if applicable.
    property client_token : String | Nil

    # Indicates whether the instance is optimized for Amazon EBS I/O. This optimization provides
    # dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal I/O
    # performance. This optimization isn't available with all instance types. Additional usage charges
    # apply when using an EBS Optimized instance.
    property ebs_optimized : Bool | Nil

    # Specifies whether enhanced networking with ENA is enabled.
    property ena_support : Bool | Nil

    # The hypervisor type of the instance. The value `xen` is used for both Xen and Nitro hypervisors.
    property hypervisor : HypervisorType | Nil

    # The IAM instance profile associated with the instance, if applicable.
    property iam_instance_profile : IamInstanceProfile | Nil

    # Indicates whether this is a Spot Instance or a Scheduled Instance.
    property instance_lifecycle : InstanceLifecycleType | Nil

    # Deprecated.
    #
    # Amazon Elastic Graphics reached end of life on January 8, 2024.
    property elastic_gpu_associations : Array(ElasticGpuAssociation) | Nil

    # Deprecated
    #
    # Amazon Elastic Inference is no longer available.
    property elastic_inference_accelerator_associations : Array(ElasticInferenceAcceleratorAssociation) | Nil

    # The network interfaces for the instance.
    property network_interfaces : Array(InstanceNetworkInterface) | Nil

    # The Amazon Resource Name (ARN) of the Outpost.
    property outpost_arn : String | Nil

    # The device name of the root device volume (for example, `/dev/sda1`).
    property root_device_name : String | Nil

    # The root device type used by the AMI. The AMI can use an EBS volume or an instance store volume.
    property root_device_type : DeviceType | Nil

    # The security groups for the instance.
    property security_groups : Array(GroupIdentifier) | Nil

    # Indicates whether source/destination checking is enabled.
    property source_dest_check : Bool | Nil

    # If the request is a Spot Instance request, the ID of the request.
    property spot_instance_request_id : String | Nil

    # Specifies whether enhanced networking with the Intel 82599 Virtual Function interface is
    # enabled.
    property sriov_net_support : String | Nil

    # The reason for the most recent state transition.
    property state_reason : StateReason | Nil

    # Any tags assigned to the instance.
    property tags : Array(Tag) | Nil

    # The virtualization type of the instance.
    property virtualization_type : VirtualizationType | Nil

    # The CPU options for the instance.
    property cpu_options : CpuOptions | Nil

    # The ID of the Capacity Block.
    #
    # For P5 instances, a Capacity Block ID refers to a group of instances. For Trn2u instances, a
    # capacity block ID refers to an EC2 UltraServer.
    property capacity_block_id : String | Nil

    # The ID of the Capacity Reservation.
    property capacity_reservation_id : String | Nil

    # Information about the Capacity Reservation targeting option.
    property capacity_reservation_specification : CapacityReservationSpecificationResponse | Nil

    # Indicates whether the instance is enabled for hibernation.
    property hibernation_options : HibernationOptions | Nil

    # The license configurations for the instance.
    property licenses : Array(LicenseConfiguration) | Nil

    # The metadata options for the instance.
    property metadata_options : InstanceMetadataOptionsResponse | Nil

    # Indicates whether the instance is enabled for Amazon Web Services Nitro Enclaves.
    property enclave_options : EnclaveOptions | Nil

    # The boot mode that was specified by the AMI. If the value is `uefi-preferred`, the AMI supports
    # both UEFI and Legacy BIOS. The `currentInstanceBootMode` parameter is the boot mode that is used
    # to boot the instance at launch or start.
    #
    # The operating system contained in the AMI must be configured to support the specified boot mode.
    #
    # For more information, see [Boot
    # modes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-boot.html) in the *Amazon EC2
    # User Guide*.
    property boot_mode : BootModeValues | Nil

    # The platform details value for the instance. For more information, see [AMI billing information
    # fields](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/billing-info-fields.html) in the
    # *Amazon EC2 User Guide*.
    property platform_details : String | Nil

    # The usage operation value for the instance. For more information, see [AMI billing information
    # fields](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/billing-info-fields.html) in the
    # *Amazon EC2 User Guide*.
    property usage_operation : String | Nil

    # The time that the usage operation was last updated.
    property usage_operation_update_time : Time | Nil

    # The options for the instance hostname.
    property private_dns_name_options : PrivateDnsNameOptionsResponse | Nil

    # The IPv6 address assigned to the instance.
    property ipv_6_address : String | Nil

    # If the instance is configured for NitroTPM support, the value is `v2.0`. For more information,
    # see [NitroTPM](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitrotpm.html) in the *Amazon
    # EC2 User Guide*.
    property tpm_support : String | Nil

    # Provides information on the recovery and maintenance options of your instance.
    property maintenance_options : InstanceMaintenanceOptions | Nil

    # The boot mode that is used to boot the instance at launch or start. For more information, see
    # [Boot modes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-boot.html) in the *Amazon
    # EC2 User Guide*.
    property current_instance_boot_mode : InstanceBootModeValues | Nil

    # Contains settings for the network performance options for your instance.
    property network_performance_options : InstanceNetworkPerformanceOptions | Nil

    # The service provider that manages the instance.
    property operator : OperatorResponse | Nil

    # The secondary interfaces for the instance.
    property secondary_interfaces : Array(InstanceSecondaryInterface) | Nil

    # The ID of the instance.
    property instance_id : String | Nil

    # The ID of the AMI used to launch the instance.
    property image_id : String | Nil

    # The current state of the instance.
    property state : InstanceState | Nil

    # [IPv4 only] The private DNS hostname name assigned to the instance. This DNS hostname can only
    # be used inside the Amazon EC2 network. This name is not available until the instance enters the
    # `running` state.
    #
    # The Amazon-provided DNS server resolves Amazon-provided private DNS hostnames if you've enabled
    # DNS resolution and DNS hostnames in your VPC. If you are not using the Amazon-provided DNS
    # server in your VPC, your custom domain name servers must resolve the hostname as appropriate.
    property private_dns_name : String | Nil

    # The public DNS name assigned to the instance. This name is not available until the instance
    # enters the `running` state. This name is only available if you've enabled DNS hostnames for your
    # VPC. The format of this name depends on the [public hostname
    # type](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/hostname-types.html#public-hostnames).
    property public_dns_name : String | Nil

    # The reason for the most recent state transition. This might be an empty string.
    property state_transition_reason : String | Nil

    # The name of the key pair, if this instance was launched with an associated key pair.
    property key_name : String | Nil

    # The AMI launch index, which can be used to find this instance in the launch group.
    property ami_launch_index : Int32 | Nil

    # The product codes attached to this instance, if applicable.
    property product_codes : Array(ProductCode) | Nil

    # The instance type.
    property instance_type : InstanceType | Nil

    # The time that the instance was last launched. To determine the time that instance was first
    # launched, see the attachment time for the primary network interface.
    property launch_time : Time | Nil

    # The location where the instance launched, if applicable.
    property placement : Placement | Nil

    # The kernel associated with this instance, if applicable.
    property kernel_id : String | Nil

    # The RAM disk associated with this instance, if applicable.
    property ramdisk_id : String | Nil

    # The platform. This value is `windows` for Windows instances; otherwise, it is empty.
    property platform : PlatformValues | Nil

    # The monitoring for the instance.
    property monitoring : Monitoring | Nil

    # The ID of the subnet in which the instance is running.
    property subnet_id : String | Nil

    # The ID of the VPC in which the instance is running.
    property vpc_id : String | Nil

    # The private IPv4 address assigned to the instance.
    property private_ip_address : String | Nil

    # The public IPv4 address, or the Carrier IP address assigned to the instance, if applicable.
    #
    # A Carrier IP address only applies to an instance launched in a subnet associated with a
    # Wavelength Zone.
    property public_ip_address : String | Nil

    def initialize(
      @architecture : ArchitectureValues | Nil = nil,
      @block_device_mappings : Array(InstanceBlockDeviceMapping) | Nil = nil,
      @client_token : String | Nil = nil,
      @ebs_optimized : Bool | Nil = nil,
      @ena_support : Bool | Nil = nil,
      @hypervisor : HypervisorType | Nil = nil,
      @iam_instance_profile : IamInstanceProfile | Nil = nil,
      @instance_lifecycle : InstanceLifecycleType | Nil = nil,
      @elastic_gpu_associations : Array(ElasticGpuAssociation) | Nil = nil,
      @elastic_inference_accelerator_associations : Array(ElasticInferenceAcceleratorAssociation) | Nil = nil,
      @network_interfaces : Array(InstanceNetworkInterface) | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @root_device_name : String | Nil = nil,
      @root_device_type : DeviceType | Nil = nil,
      @security_groups : Array(GroupIdentifier) | Nil = nil,
      @source_dest_check : Bool | Nil = nil,
      @spot_instance_request_id : String | Nil = nil,
      @sriov_net_support : String | Nil = nil,
      @state_reason : StateReason | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @virtualization_type : VirtualizationType | Nil = nil,
      @cpu_options : CpuOptions | Nil = nil,
      @capacity_block_id : String | Nil = nil,
      @capacity_reservation_id : String | Nil = nil,
      @capacity_reservation_specification : CapacityReservationSpecificationResponse | Nil = nil,
      @hibernation_options : HibernationOptions | Nil = nil,
      @licenses : Array(LicenseConfiguration) | Nil = nil,
      @metadata_options : InstanceMetadataOptionsResponse | Nil = nil,
      @enclave_options : EnclaveOptions | Nil = nil,
      @boot_mode : BootModeValues | Nil = nil,
      @platform_details : String | Nil = nil,
      @usage_operation : String | Nil = nil,
      @usage_operation_update_time : Time | Nil = nil,
      @private_dns_name_options : PrivateDnsNameOptionsResponse | Nil = nil,
      @ipv_6_address : String | Nil = nil,
      @tpm_support : String | Nil = nil,
      @maintenance_options : InstanceMaintenanceOptions | Nil = nil,
      @current_instance_boot_mode : InstanceBootModeValues | Nil = nil,
      @network_performance_options : InstanceNetworkPerformanceOptions | Nil = nil,
      @operator : OperatorResponse | Nil = nil,
      @secondary_interfaces : Array(InstanceSecondaryInterface) | Nil = nil,
      @instance_id : String | Nil = nil,
      @image_id : String | Nil = nil,
      @state : InstanceState | Nil = nil,
      @private_dns_name : String | Nil = nil,
      @public_dns_name : String | Nil = nil,
      @state_transition_reason : String | Nil = nil,
      @key_name : String | Nil = nil,
      @ami_launch_index : Int32 | Nil = nil,
      @product_codes : Array(ProductCode) | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @launch_time : Time | Nil = nil,
      @placement : Placement | Nil = nil,
      @kernel_id : String | Nil = nil,
      @ramdisk_id : String | Nil = nil,
      @platform : PlatformValues | Nil = nil,
      @monitoring : Monitoring | Nil = nil,
      @subnet_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @private_ip_address : String | Nil = nil,
      @public_ip_address : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @architecture
        params << {"#{prefix}Architecture", value.to_json_object_key}
      end

      (@block_device_mappings || [] of InstanceBlockDeviceMapping).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMapping.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @ebs_optimized
        params << {"#{prefix}EbsOptimized", Core::QueryValue.bool(value)}
      end

      if value = @ena_support
        params << {"#{prefix}EnaSupport", Core::QueryValue.bool(value)}
      end

      if value = @hypervisor
        params << {"#{prefix}Hypervisor", value.to_json_object_key}
      end

      if value = @iam_instance_profile
        params.concat(value.to_query_params("#{prefix}IamInstanceProfile."))
      end

      if value = @instance_lifecycle
        params << {"#{prefix}InstanceLifecycle", value.to_json_object_key}
      end

      (@elastic_gpu_associations || [] of ElasticGpuAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ElasticGpuAssociationSet.#{i}."))
      end

      (@elastic_inference_accelerator_associations || [] of ElasticInferenceAcceleratorAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ElasticInferenceAcceleratorAssociationSet.#{i}."))
      end

      (@network_interfaces || [] of InstanceNetworkInterface).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NetworkInterfaceSet.#{i}."))
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @root_device_name
        params << {"#{prefix}RootDeviceName", value}
      end

      if value = @root_device_type
        params << {"#{prefix}RootDeviceType", value.to_json_object_key}
      end

      (@security_groups || [] of GroupIdentifier).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GroupSet.#{i}."))
      end

      if value = @source_dest_check
        params << {"#{prefix}SourceDestCheck", Core::QueryValue.bool(value)}
      end

      if value = @spot_instance_request_id
        params << {"#{prefix}SpotInstanceRequestId", value}
      end

      if value = @sriov_net_support
        params << {"#{prefix}SriovNetSupport", value}
      end

      if value = @state_reason
        params.concat(value.to_query_params("#{prefix}StateReason."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @virtualization_type
        params << {"#{prefix}VirtualizationType", value.to_json_object_key}
      end

      if value = @cpu_options
        params.concat(value.to_query_params("#{prefix}CpuOptions."))
      end

      if value = @capacity_block_id
        params << {"#{prefix}CapacityBlockId", value}
      end

      if value = @capacity_reservation_id
        params << {"#{prefix}CapacityReservationId", value}
      end

      if value = @capacity_reservation_specification
        params.concat(value.to_query_params("#{prefix}CapacityReservationSpecification."))
      end

      if value = @hibernation_options
        params.concat(value.to_query_params("#{prefix}HibernationOptions."))
      end

      (@licenses || [] of LicenseConfiguration).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LicenseSet.#{i}."))
      end

      if value = @metadata_options
        params.concat(value.to_query_params("#{prefix}MetadataOptions."))
      end

      if value = @enclave_options
        params.concat(value.to_query_params("#{prefix}EnclaveOptions."))
      end

      if value = @boot_mode
        params << {"#{prefix}BootMode", value.to_json_object_key}
      end

      if value = @platform_details
        params << {"#{prefix}PlatformDetails", value}
      end

      if value = @usage_operation
        params << {"#{prefix}UsageOperation", value}
      end

      if value = @usage_operation_update_time
        params << {"#{prefix}UsageOperationUpdateTime", Core::QueryValue.time(value)}
      end

      if value = @private_dns_name_options
        params.concat(value.to_query_params("#{prefix}PrivateDnsNameOptions."))
      end

      if value = @ipv_6_address
        params << {"#{prefix}Ipv6Address", value}
      end

      if value = @tpm_support
        params << {"#{prefix}TpmSupport", value}
      end

      if value = @maintenance_options
        params.concat(value.to_query_params("#{prefix}MaintenanceOptions."))
      end

      if value = @current_instance_boot_mode
        params << {"#{prefix}CurrentInstanceBootMode", value.to_json_object_key}
      end

      if value = @network_performance_options
        params.concat(value.to_query_params("#{prefix}NetworkPerformanceOptions."))
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end

      (@secondary_interfaces || [] of InstanceSecondaryInterface).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecondaryInterfaceSet.#{i}."))
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @state
        params.concat(value.to_query_params("#{prefix}InstanceState."))
      end

      if value = @private_dns_name
        params << {"#{prefix}PrivateDnsName", value}
      end

      if value = @public_dns_name
        params << {"#{prefix}DnsName", value}
      end

      if value = @state_transition_reason
        params << {"#{prefix}Reason", value}
      end

      if value = @key_name
        params << {"#{prefix}KeyName", value}
      end

      if value = @ami_launch_index
        params << {"#{prefix}AmiLaunchIndex", value.to_s}
      end

      (@product_codes || [] of ProductCode).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ProductCodes.#{i}."))
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @launch_time
        params << {"#{prefix}LaunchTime", Core::QueryValue.time(value)}
      end

      if value = @placement
        params.concat(value.to_query_params("#{prefix}Placement."))
      end

      if value = @kernel_id
        params << {"#{prefix}KernelId", value}
      end

      if value = @ramdisk_id
        params << {"#{prefix}RamdiskId", value}
      end

      if value = @platform
        params << {"#{prefix}Platform", value.to_json_object_key}
      end

      if value = @monitoring
        params.concat(value.to_query_params("#{prefix}Monitoring."))
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end

      if value = @public_ip_address
        params << {"#{prefix}IpAddress", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        architecture: (n = node.xpath_node("*[local-name()='architecture']")) ? AEC::ArchitectureValues.from_json_object_key?(n.content) : nil,
        block_device_mappings: node.xpath_nodes("*[local-name()='blockDeviceMapping']/*[local-name()='item']").map { |n| InstanceBlockDeviceMapping.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
        ebs_optimized: Core::XMLValue.bool(node.xpath_node("*[local-name()='ebsOptimized']")),
        ena_support: Core::XMLValue.bool(node.xpath_node("*[local-name()='enaSupport']")),
        hypervisor: (n = node.xpath_node("*[local-name()='hypervisor']")) ? AEC::HypervisorType.from_json_object_key?(n.content) : nil,
        iam_instance_profile: node.xpath_node("*[local-name()='iamInstanceProfile']").try { |n| IamInstanceProfile.from_xml(n) },
        instance_lifecycle: (n = node.xpath_node("*[local-name()='instanceLifecycle']")) ? AEC::InstanceLifecycleType.from_json_object_key?(n.content) : nil,
        elastic_gpu_associations: node.xpath_nodes("*[local-name()='elasticGpuAssociationSet']/*[local-name()='item']").map { |n| ElasticGpuAssociation.from_xml(n) },
        elastic_inference_accelerator_associations: node.xpath_nodes("*[local-name()='elasticInferenceAcceleratorAssociationSet']/*[local-name()='item']").map { |n| ElasticInferenceAcceleratorAssociation.from_xml(n) },
        network_interfaces: node.xpath_nodes("*[local-name()='networkInterfaceSet']/*[local-name()='item']").map { |n| InstanceNetworkInterface.from_xml(n) },
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        root_device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='rootDeviceName']")),
        root_device_type: (n = node.xpath_node("*[local-name()='rootDeviceType']")) ? AEC::DeviceType.from_json_object_key?(n.content) : nil,
        security_groups: node.xpath_nodes("*[local-name()='groupSet']/*[local-name()='item']").map { |n| GroupIdentifier.from_xml(n) },
        source_dest_check: Core::XMLValue.bool(node.xpath_node("*[local-name()='sourceDestCheck']")),
        spot_instance_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='spotInstanceRequestId']")),
        sriov_net_support: Core::XMLValue.string(node.xpath_node("*[local-name()='sriovNetSupport']")),
        state_reason: node.xpath_node("*[local-name()='stateReason']").try { |n| StateReason.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        virtualization_type: (n = node.xpath_node("*[local-name()='virtualizationType']")) ? AEC::VirtualizationType.from_json_object_key?(n.content) : nil,
        cpu_options: node.xpath_node("*[local-name()='cpuOptions']").try { |n| CpuOptions.from_xml(n) },
        capacity_block_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityBlockId']")),
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationId']")),
        capacity_reservation_specification: node.xpath_node("*[local-name()='capacityReservationSpecification']").try { |n| CapacityReservationSpecificationResponse.from_xml(n) },
        hibernation_options: node.xpath_node("*[local-name()='hibernationOptions']").try { |n| HibernationOptions.from_xml(n) },
        licenses: node.xpath_nodes("*[local-name()='licenseSet']/*[local-name()='item']").map { |n| LicenseConfiguration.from_xml(n) },
        metadata_options: node.xpath_node("*[local-name()='metadataOptions']").try { |n| InstanceMetadataOptionsResponse.from_xml(n) },
        enclave_options: node.xpath_node("*[local-name()='enclaveOptions']").try { |n| EnclaveOptions.from_xml(n) },
        boot_mode: (n = node.xpath_node("*[local-name()='bootMode']")) ? AEC::BootModeValues.from_json_object_key?(n.content) : nil,
        platform_details: Core::XMLValue.string(node.xpath_node("*[local-name()='platformDetails']")),
        usage_operation: Core::XMLValue.string(node.xpath_node("*[local-name()='usageOperation']")),
        usage_operation_update_time: Core::XMLValue.time(node.xpath_node("*[local-name()='usageOperationUpdateTime']")),
        private_dns_name_options: node.xpath_node("*[local-name()='privateDnsNameOptions']").try { |n| PrivateDnsNameOptionsResponse.from_xml(n) },
        ipv_6_address: Core::XMLValue.string(node.xpath_node("*[local-name()='ipv6Address']")),
        tpm_support: Core::XMLValue.string(node.xpath_node("*[local-name()='tpmSupport']")),
        maintenance_options: node.xpath_node("*[local-name()='maintenanceOptions']").try { |n| InstanceMaintenanceOptions.from_xml(n) },
        current_instance_boot_mode: (n = node.xpath_node("*[local-name()='currentInstanceBootMode']")) ? AEC::InstanceBootModeValues.from_json_object_key?(n.content) : nil,
        network_performance_options: node.xpath_node("*[local-name()='networkPerformanceOptions']").try { |n| InstanceNetworkPerformanceOptions.from_xml(n) },
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
        secondary_interfaces: node.xpath_nodes("*[local-name()='secondaryInterfaceSet']/*[local-name()='item']").map { |n| InstanceSecondaryInterface.from_xml(n) },
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        state: node.xpath_node("*[local-name()='instanceState']").try { |n| InstanceState.from_xml(n) },
        private_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='privateDnsName']")),
        public_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='dnsName']")),
        state_transition_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='reason']")),
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='keyName']")),
        ami_launch_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='amiLaunchIndex']")),
        product_codes: node.xpath_nodes("*[local-name()='productCodes']/*[local-name()='item']").map { |n| ProductCode.from_xml(n) },
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        launch_time: Core::XMLValue.time(node.xpath_node("*[local-name()='launchTime']")),
        placement: node.xpath_node("*[local-name()='placement']").try { |n| Placement.from_xml(n) },
        kernel_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kernelId']")),
        ramdisk_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ramdiskId']")),
        platform: (n = node.xpath_node("*[local-name()='platform']")) ? AEC::PlatformValues.from_json_object_key?(n.content) : nil,
        monitoring: node.xpath_node("*[local-name()='monitoring']").try { |n| Monitoring.from_xml(n) },
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='privateIpAddress']")),
        public_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='ipAddress']")),
      )
    end

    def validate! : Nil
      if value = @block_device_mappings
        value.each(&.validate!)
      end

      if value = @iam_instance_profile
        value.validate!
      end

      if value = @elastic_gpu_associations
        value.each(&.validate!)
      end

      if value = @elastic_inference_accelerator_associations
        value.each(&.validate!)
      end

      if value = @network_interfaces
        value.each(&.validate!)
      end

      if value = @security_groups
        value.each(&.validate!)
      end

      if value = @state_reason
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
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

      if value = @licenses
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

      if value = @state
        value.validate!
      end

      if value = @product_codes
        value.each(&.validate!)
      end

      if value = @placement
        value.validate!
      end

      if value = @monitoring
        value.validate!
      end
    end

    def_equals_and_hash(@architecture, @block_device_mappings, @client_token, @ebs_optimized, @ena_support, @hypervisor, @iam_instance_profile, @instance_lifecycle, @elastic_gpu_associations, @elastic_inference_accelerator_associations, @network_interfaces, @outpost_arn, @root_device_name, @root_device_type, @security_groups, @source_dest_check, @spot_instance_request_id, @sriov_net_support, @state_reason, @tags, @virtualization_type, @cpu_options, @capacity_block_id, @capacity_reservation_id, @capacity_reservation_specification, @hibernation_options, @licenses, @metadata_options, @enclave_options, @boot_mode, @platform_details, @usage_operation, @usage_operation_update_time, @private_dns_name_options, @ipv_6_address, @tpm_support, @maintenance_options, @current_instance_boot_mode, @network_performance_options, @operator, @secondary_interfaces, @instance_id, @image_id, @state, @private_dns_name, @public_dns_name, @state_transition_reason, @key_name, @ami_launch_index, @product_codes, @instance_type, @launch_time, @placement, @kernel_id, @ramdisk_id, @platform, @monitoring, @subnet_id, @vpc_id, @private_ip_address, @public_ip_address)
  end
end
