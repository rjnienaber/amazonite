private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The information for a launch template.
  class ResponseLaunchTemplateData
    # The ID of the kernel, if applicable.
    property kernel_id : String | Nil

    # Indicates whether the instance is optimized for Amazon EBS I/O.
    property ebs_optimized : Bool | Nil

    # The IAM instance profile.
    property iam_instance_profile : LaunchTemplateIamInstanceProfileSpecification | Nil

    # The block device mappings.
    property block_device_mappings : Array(LaunchTemplateBlockDeviceMapping) | Nil

    # The network interfaces.
    property network_interfaces : Array(LaunchTemplateInstanceNetworkInterfaceSpecification) | Nil

    # The ID of the AMI or a Systems Manager parameter. The Systems Manager parameter will resolve to
    # the ID of the AMI at instance launch.
    #
    # The value depends on what you specified in the request. The possible values are:
    #
    # - If an AMI ID was specified in the request, then this is the AMI ID.
    #
    # - If a Systems Manager parameter was specified in the request, and `ResolveAlias` was configured
    # as `true`, then this is the AMI ID that the parameter is mapped to in the Parameter Store.
    #
    # - If a Systems Manager parameter was specified in the request, and `ResolveAlias` was configured
    # as `false`, then this is the parameter value.
    #
    # For more information, see [Use a Systems Manager parameter instead of an AMI
    # ID](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html#use-an-ssm-parameter-instead-of-an-ami-id)
    # in the *Amazon EC2 User Guide*.
    property image_id : String | Nil

    # The instance type.
    property instance_type : InstanceType | Nil

    # The name of the key pair.
    property key_name : String | Nil

    # The monitoring for the instance.
    property monitoring : LaunchTemplatesMonitoring | Nil

    # The placement of the instance.
    property placement : LaunchTemplatePlacement | Nil

    # The ID of the RAM disk, if applicable.
    property ram_disk_id : String | Nil

    # If set to `true`, indicates that the instance cannot be terminated using the Amazon EC2 console,
    # command line tool, or API.
    property disable_api_termination : Bool | Nil

    # Indicates whether an instance stops or terminates when you initiate shutdown from the instance
    # (using the operating system command for system shutdown).
    property instance_initiated_shutdown_behavior : ShutdownBehavior | Nil

    # The user data for the instance.
    property user_data : String | Nil

    # The tags that are applied to the resources that are created during instance launch.
    property tag_specifications : Array(LaunchTemplateTagSpecification) | Nil

    # Deprecated.
    #
    # Amazon Elastic Graphics reached end of life on January 8, 2024.
    property elastic_gpu_specifications : Array(ElasticGpuSpecificationResponse) | Nil

    # Amazon Elastic Inference is no longer available.
    #
    # An elastic inference accelerator to associate with the instance. Elastic inference accelerators
    # are a resource you can attach to your Amazon EC2 instances to accelerate your Deep Learning (DL)
    # inference workloads.
    #
    # You cannot specify accelerators from different generations in the same request.
    property elastic_inference_accelerators : Array(LaunchTemplateElasticInferenceAcceleratorResponse) | Nil

    # The security group IDs.
    property security_group_ids : Array(String) | Nil

    # The security group names.
    property security_groups : Array(String) | Nil

    # The market (purchasing) option for the instances.
    property instance_market_options : LaunchTemplateInstanceMarketOptions | Nil

    # The credit option for CPU usage of the instance.
    property credit_specification : CreditSpecification | Nil

    # The CPU options for the instance. For more information, see [CPU options for Amazon EC2
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-optimize-cpu.html) in
    # the *Amazon EC2 User Guide*.
    property cpu_options : LaunchTemplateCpuOptions | Nil

    # Information about the Capacity Reservation targeting option.
    property capacity_reservation_specification : LaunchTemplateCapacityReservationSpecificationResponse | Nil

    # The license configurations.
    property license_specifications : Array(LaunchTemplateLicenseConfiguration) | Nil

    # Indicates whether an instance is configured for hibernation. For more information, see
    # [Hibernate your Amazon EC2
    # instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html) in the *Amazon EC2
    # User Guide*.
    property hibernation_options : LaunchTemplateHibernationOptions | Nil

    # The metadata options for the instance. For more information, see [Configure the Instance
    # Metadata Service
    # options](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-options.html)
    # in the *Amazon EC2 User Guide*.
    property metadata_options : LaunchTemplateInstanceMetadataOptions | Nil

    # Indicates whether the instance is enabled for Amazon Web Services Nitro Enclaves.
    property enclave_options : LaunchTemplateEnclaveOptions | Nil

    # The attributes for the instance types. When you specify instance attributes, Amazon EC2 will
    # identify instance types with these attributes.
    #
    # If you specify `InstanceRequirements`, you can't specify `InstanceTypes`.
    property instance_requirements : InstanceRequirements | Nil

    # The options for the instance hostname.
    property private_dns_name_options : LaunchTemplatePrivateDnsNameOptions | Nil

    # The maintenance options for your instance.
    property maintenance_options : LaunchTemplateInstanceMaintenanceOptions | Nil

    # Indicates whether the instance is enabled for stop protection. For more information, see [Enable
    # stop protection for your EC2
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-stop-protection.html) in the
    # *Amazon EC2 User Guide*.
    property disable_api_stop : Bool | Nil

    # The entity that manages the launch template.
    property operator : OperatorResponse | Nil

    # Contains the launch template settings for network performance options for your instance.
    property network_performance_options : LaunchTemplateNetworkPerformanceOptions | Nil

    # The secondary interfaces associated with the launch template.
    property secondary_interfaces : Array(LaunchTemplateInstanceSecondaryInterfaceSpecification) | Nil

    def initialize(
      @kernel_id : String | Nil = nil,
      @ebs_optimized : Bool | Nil = nil,
      @iam_instance_profile : LaunchTemplateIamInstanceProfileSpecification | Nil = nil,
      @block_device_mappings : Array(LaunchTemplateBlockDeviceMapping) | Nil = nil,
      @network_interfaces : Array(LaunchTemplateInstanceNetworkInterfaceSpecification) | Nil = nil,
      @image_id : String | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @key_name : String | Nil = nil,
      @monitoring : LaunchTemplatesMonitoring | Nil = nil,
      @placement : LaunchTemplatePlacement | Nil = nil,
      @ram_disk_id : String | Nil = nil,
      @disable_api_termination : Bool | Nil = nil,
      @instance_initiated_shutdown_behavior : ShutdownBehavior | Nil = nil,
      @user_data : String | Nil = nil,
      @tag_specifications : Array(LaunchTemplateTagSpecification) | Nil = nil,
      @elastic_gpu_specifications : Array(ElasticGpuSpecificationResponse) | Nil = nil,
      @elastic_inference_accelerators : Array(LaunchTemplateElasticInferenceAcceleratorResponse) | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @security_groups : Array(String) | Nil = nil,
      @instance_market_options : LaunchTemplateInstanceMarketOptions | Nil = nil,
      @credit_specification : CreditSpecification | Nil = nil,
      @cpu_options : LaunchTemplateCpuOptions | Nil = nil,
      @capacity_reservation_specification : LaunchTemplateCapacityReservationSpecificationResponse | Nil = nil,
      @license_specifications : Array(LaunchTemplateLicenseConfiguration) | Nil = nil,
      @hibernation_options : LaunchTemplateHibernationOptions | Nil = nil,
      @metadata_options : LaunchTemplateInstanceMetadataOptions | Nil = nil,
      @enclave_options : LaunchTemplateEnclaveOptions | Nil = nil,
      @instance_requirements : InstanceRequirements | Nil = nil,
      @private_dns_name_options : LaunchTemplatePrivateDnsNameOptions | Nil = nil,
      @maintenance_options : LaunchTemplateInstanceMaintenanceOptions | Nil = nil,
      @disable_api_stop : Bool | Nil = nil,
      @operator : OperatorResponse | Nil = nil,
      @network_performance_options : LaunchTemplateNetworkPerformanceOptions | Nil = nil,
      @secondary_interfaces : Array(LaunchTemplateInstanceSecondaryInterfaceSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @kernel_id
        params << {"#{prefix}KernelId", value}
      end

      if value = @ebs_optimized
        params << {"#{prefix}EbsOptimized", Core::QueryValue.bool(value)}
      end

      if value = @iam_instance_profile
        params.concat(value.to_query_params("#{prefix}IamInstanceProfile."))
      end

      (@block_device_mappings || [] of LaunchTemplateBlockDeviceMapping).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMappingSet.#{i}."))
      end

      (@network_interfaces || [] of LaunchTemplateInstanceNetworkInterfaceSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NetworkInterfaceSet.#{i}."))
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @key_name
        params << {"#{prefix}KeyName", value}
      end

      if value = @monitoring
        params.concat(value.to_query_params("#{prefix}Monitoring."))
      end

      if value = @placement
        params.concat(value.to_query_params("#{prefix}Placement."))
      end

      if value = @ram_disk_id
        params << {"#{prefix}RamDiskId", value}
      end

      if value = @disable_api_termination
        params << {"#{prefix}DisableApiTermination", Core::QueryValue.bool(value)}
      end

      if value = @instance_initiated_shutdown_behavior
        params << {"#{prefix}InstanceInitiatedShutdownBehavior", value.to_json_object_key}
      end

      if value = @user_data
        params << {"#{prefix}UserData", value}
      end

      (@tag_specifications || [] of LaunchTemplateTagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecificationSet.#{i}."))
      end

      (@elastic_gpu_specifications || [] of ElasticGpuSpecificationResponse).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ElasticGpuSpecificationSet.#{i}."))
      end

      (@elastic_inference_accelerators || [] of LaunchTemplateElasticInferenceAcceleratorResponse).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ElasticInferenceAcceleratorSet.#{i}."))
      end

      (@security_group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupIdSet.#{i}", item}
      end

      (@security_groups || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupSet.#{i}", item}
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

      (@license_specifications || [] of LaunchTemplateLicenseConfiguration).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LicenseSet.#{i}."))
      end

      if value = @hibernation_options
        params.concat(value.to_query_params("#{prefix}HibernationOptions."))
      end

      if value = @metadata_options
        params.concat(value.to_query_params("#{prefix}MetadataOptions."))
      end

      if value = @enclave_options
        params.concat(value.to_query_params("#{prefix}EnclaveOptions."))
      end

      if value = @instance_requirements
        params.concat(value.to_query_params("#{prefix}InstanceRequirements."))
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

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end

      if value = @network_performance_options
        params.concat(value.to_query_params("#{prefix}NetworkPerformanceOptions."))
      end

      (@secondary_interfaces || [] of LaunchTemplateInstanceSecondaryInterfaceSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecondaryInterfaceSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        kernel_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kernelId']")),
        ebs_optimized: Core::XMLValue.bool(node.xpath_node("*[local-name()='ebsOptimized']")),
        iam_instance_profile: node.xpath_node("*[local-name()='iamInstanceProfile']").try { |n| LaunchTemplateIamInstanceProfileSpecification.from_xml(n) },
        block_device_mappings: node.xpath_nodes("*[local-name()='blockDeviceMappingSet']/*[local-name()='item']").map { |n| LaunchTemplateBlockDeviceMapping.from_xml(n) },
        network_interfaces: node.xpath_nodes("*[local-name()='networkInterfaceSet']/*[local-name()='item']").map { |n| LaunchTemplateInstanceNetworkInterfaceSpecification.from_xml(n) },
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='keyName']")),
        monitoring: node.xpath_node("*[local-name()='monitoring']").try { |n| LaunchTemplatesMonitoring.from_xml(n) },
        placement: node.xpath_node("*[local-name()='placement']").try { |n| LaunchTemplatePlacement.from_xml(n) },
        ram_disk_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ramDiskId']")),
        disable_api_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='disableApiTermination']")),
        instance_initiated_shutdown_behavior: (n = node.xpath_node("*[local-name()='instanceInitiatedShutdownBehavior']")) ? AEC::ShutdownBehavior.from_json_object_key?(n.content) : nil,
        user_data: Core::XMLValue.string(node.xpath_node("*[local-name()='userData']")),
        tag_specifications: node.xpath_nodes("*[local-name()='tagSpecificationSet']/*[local-name()='item']").map { |n| LaunchTemplateTagSpecification.from_xml(n) },
        elastic_gpu_specifications: node.xpath_nodes("*[local-name()='elasticGpuSpecificationSet']/*[local-name()='item']").map { |n| ElasticGpuSpecificationResponse.from_xml(n) },
        elastic_inference_accelerators: node.xpath_nodes("*[local-name()='elasticInferenceAcceleratorSet']/*[local-name()='item']").map { |n| LaunchTemplateElasticInferenceAcceleratorResponse.from_xml(n) },
        security_group_ids: node.xpath_nodes("*[local-name()='securityGroupIdSet']/*[local-name()='item']").map { |n| n.content },
        security_groups: node.xpath_nodes("*[local-name()='securityGroupSet']/*[local-name()='item']").map { |n| n.content },
        instance_market_options: node.xpath_node("*[local-name()='instanceMarketOptions']").try { |n| LaunchTemplateInstanceMarketOptions.from_xml(n) },
        credit_specification: node.xpath_node("*[local-name()='creditSpecification']").try { |n| CreditSpecification.from_xml(n) },
        cpu_options: node.xpath_node("*[local-name()='cpuOptions']").try { |n| LaunchTemplateCpuOptions.from_xml(n) },
        capacity_reservation_specification: node.xpath_node("*[local-name()='capacityReservationSpecification']").try { |n| LaunchTemplateCapacityReservationSpecificationResponse.from_xml(n) },
        license_specifications: node.xpath_nodes("*[local-name()='licenseSet']/*[local-name()='item']").map { |n| LaunchTemplateLicenseConfiguration.from_xml(n) },
        hibernation_options: node.xpath_node("*[local-name()='hibernationOptions']").try { |n| LaunchTemplateHibernationOptions.from_xml(n) },
        metadata_options: node.xpath_node("*[local-name()='metadataOptions']").try { |n| LaunchTemplateInstanceMetadataOptions.from_xml(n) },
        enclave_options: node.xpath_node("*[local-name()='enclaveOptions']").try { |n| LaunchTemplateEnclaveOptions.from_xml(n) },
        instance_requirements: node.xpath_node("*[local-name()='instanceRequirements']").try { |n| InstanceRequirements.from_xml(n) },
        private_dns_name_options: node.xpath_node("*[local-name()='privateDnsNameOptions']").try { |n| LaunchTemplatePrivateDnsNameOptions.from_xml(n) },
        maintenance_options: node.xpath_node("*[local-name()='maintenanceOptions']").try { |n| LaunchTemplateInstanceMaintenanceOptions.from_xml(n) },
        disable_api_stop: Core::XMLValue.bool(node.xpath_node("*[local-name()='disableApiStop']")),
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
        network_performance_options: node.xpath_node("*[local-name()='networkPerformanceOptions']").try { |n| LaunchTemplateNetworkPerformanceOptions.from_xml(n) },
        secondary_interfaces: node.xpath_nodes("*[local-name()='secondaryInterfaceSet']/*[local-name()='item']").map { |n| LaunchTemplateInstanceSecondaryInterfaceSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @iam_instance_profile
        value.validate!
      end

      if value = @block_device_mappings
        value.each(&.validate!)
      end

      if value = @network_interfaces
        value.each(&.validate!)
      end

      if value = @monitoring
        value.validate!
      end

      if value = @placement
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @elastic_gpu_specifications
        value.each(&.validate!)
      end

      if value = @elastic_inference_accelerators
        value.each(&.validate!)
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

      if value = @license_specifications
        value.each(&.validate!)
      end

      if value = @hibernation_options
        value.validate!
      end

      if value = @metadata_options
        value.validate!
      end

      if value = @enclave_options
        value.validate!
      end

      if value = @instance_requirements
        value.validate!
      end

      if value = @private_dns_name_options
        value.validate!
      end

      if value = @maintenance_options
        value.validate!
      end

      if value = @operator
        value.validate!
      end

      if value = @network_performance_options
        value.validate!
      end

      if value = @secondary_interfaces
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@kernel_id, @ebs_optimized, @iam_instance_profile, @block_device_mappings, @network_interfaces, @image_id, @instance_type, @key_name, @monitoring, @placement, @ram_disk_id, @disable_api_termination, @instance_initiated_shutdown_behavior, @user_data, @tag_specifications, @elastic_gpu_specifications, @elastic_inference_accelerators, @security_group_ids, @security_groups, @instance_market_options, @credit_specification, @cpu_options, @capacity_reservation_specification, @license_specifications, @hibernation_options, @metadata_options, @enclave_options, @instance_requirements, @private_dns_name_options, @maintenance_options, @disable_api_stop, @operator, @network_performance_options, @secondary_interfaces)
  end
end
