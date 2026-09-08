private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The information to include in the launch template.
  #
  # You must specify at least one parameter for the launch template data.
  class RequestLaunchTemplateData
    # The ID of the kernel.
    #
    # We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see
    # [User provided kernels](https://docs.aws.amazon.com/linux/al2/ug/UserProvidedKernels.html) in
    # the *Amazon Linux 2 User Guide*.
    property kernel_id : String | Nil

    # Indicates whether the instance is optimized for Amazon EBS I/O. This optimization provides
    # dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal
    # Amazon EBS I/O performance. This optimization isn't available with all instance types.
    # Additional usage charges apply when using an EBS-optimized instance.
    property ebs_optimized : Bool | Nil

    # The name or Amazon Resource Name (ARN) of an IAM instance profile.
    property iam_instance_profile : LaunchTemplateIamInstanceProfileSpecificationRequest | Nil

    # The block device mapping.
    property block_device_mappings : Array(LaunchTemplateBlockDeviceMappingRequest) | Nil

    # The network interfaces for the instance.
    property network_interfaces : Array(LaunchTemplateInstanceNetworkInterfaceSpecificationRequest) | Nil

    # The ID of the AMI in the format `ami-0ac394d6a3example`.
    #
    # Alternatively, you can specify a Systems Manager parameter, using one of the following formats.
    # The Systems Manager parameter will resolve to an AMI ID on launch.
    #
    # To reference a public parameter:
    #
    # - `resolve:ssm:*public-parameter* `
    #
    # To reference a parameter stored in the same account:
    #
    # - `resolve:ssm:*parameter-name* `
    #
    # - `resolve:ssm:*parameter-name:version-number* `
    #
    # - `resolve:ssm:*parameter-name:label* `
    #
    # To reference a parameter shared from another Amazon Web Services account:
    #
    # - `resolve:ssm:*parameter-ARN* `
    #
    # - `resolve:ssm:*parameter-ARN:version-number* `
    #
    # - `resolve:ssm:*parameter-ARN:label* `
    #
    # For more information, see [Use a Systems Manager parameter instead of an AMI
    # ID](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html#use-an-ssm-parameter-instead-of-an-ami-id)
    # in the *Amazon EC2 User Guide*.
    #
    # If the launch template will be used for an EC2 Fleet or Spot Fleet, note the following:
    #
    # - Only EC2 Fleets of type `instant` support specifying a Systems Manager parameter.
    #
    # - For EC2 Fleets of type `maintain` or `request`, or for Spot Fleets, you must specify the AMI
    # ID.
    property image_id : String | Nil

    # The instance type. For more information, see [Amazon EC2 instance
    # types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html) in the *Amazon
    # EC2 User Guide*.
    #
    # If you specify `InstanceType`, you can't specify `InstanceRequirements`.
    property instance_type : InstanceType | Nil

    # The name of the key pair. You can create a key pair using
    # [CreateKeyPair](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateKeyPair.html)
    # or
    # [ImportKeyPair](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ImportKeyPair.html).
    #
    # If you do not specify a key pair, you can't connect to the instance unless you choose an AMI
    # that is configured to allow users another way to log in.
    property key_name : String | Nil

    # The monitoring for the instance.
    property monitoring : LaunchTemplatesMonitoringRequest | Nil

    # The placement for the instance.
    property placement : LaunchTemplatePlacementRequest | Nil

    # The ID of the RAM disk.
    #
    # We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see
    # [User provided
    # kernels](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedkernels.html) in the
    # *Amazon EC2 User Guide*.
    property ram_disk_id : String | Nil

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

    # The user data to make available to the instance. You must provide base64-encoded text. User data
    # is limited to 16 KB. For more information, see [Run commands when you launch an EC2 instance
    # with user data input](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html) in the
    # *Amazon EC2 User Guide*.
    #
    # If you are creating the launch template for use with Batch, the user data must be provided in
    # the [MIME multi-part archive
    # format](https://cloudinit.readthedocs.io/en/latest/topics/format.html#mime-multi-part-archive).
    # For more information, see [Amazon EC2 user data in launch
    # templates](https://docs.aws.amazon.com/batch/latest/userguide/launch-templates.html#lt-user-data)
    # in the *Batch User Guide*.
    property user_data : String | Nil

    # The tags to apply to the resources that are created during instance launch. These tags are not
    # applied to the launch template.
    property tag_specifications : Array(LaunchTemplateTagSpecificationRequest) | Nil

    # Deprecated.
    #
    # Amazon Elastic Graphics reached end of life on January 8, 2024.
    property elastic_gpu_specifications : Array(ElasticGpuSpecification) | Nil

    # Amazon Elastic Inference is no longer available.
    #
    # An elastic inference accelerator to associate with the instance. Elastic inference accelerators
    # are a resource you can attach to your Amazon EC2 instances to accelerate your Deep Learning (DL)
    # inference workloads.
    #
    # You cannot specify accelerators from different generations in the same request.
    property elastic_inference_accelerators : Array(LaunchTemplateElasticInferenceAccelerator) | Nil

    # The IDs of the security groups.
    #
    # If you specify a network interface, you must specify any security groups as part of the network
    # interface instead of using this parameter.
    property security_group_ids : Array(String) | Nil

    # The names of the security groups. For a nondefault VPC, you must use security group IDs instead.
    #
    # If you specify a network interface, you must specify any security groups as part of the network
    # interface instead of using this parameter.
    property security_groups : Array(String) | Nil

    # The market (purchasing) option for the instances.
    property instance_market_options : LaunchTemplateInstanceMarketOptionsRequest | Nil

    # The credit option for CPU usage of the instance. Valid only for T instances.
    property credit_specification : CreditSpecificationRequest | Nil

    # The CPU options for the instance. For more information, see [CPU options for Amazon EC2
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-optimize-cpu.html) in
    # the *Amazon EC2 User Guide*.
    property cpu_options : LaunchTemplateCpuOptionsRequest | Nil

    # The Capacity Reservation targeting option. If you do not specify this parameter, the instance's
    # Capacity Reservation preference defaults to `open`, which enables it to run in any open Capacity
    # Reservation that has matching attributes (instance type, platform, Availability Zone).
    property capacity_reservation_specification : LaunchTemplateCapacityReservationSpecificationRequest | Nil

    # The license configurations.
    property license_specifications : Array(LaunchTemplateLicenseConfigurationRequest) | Nil

    # Indicates whether an instance is enabled for hibernation. This parameter is valid only if the
    # instance meets the [hibernation
    # prerequisites](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/hibernating-prerequisites.html).
    # For more information, see [Hibernate your Amazon EC2
    # instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html) in the *Amazon EC2
    # User Guide*.
    property hibernation_options : LaunchTemplateHibernationOptionsRequest | Nil

    # The metadata options for the instance. For more information, see [Configure the Instance
    # Metadata Service
    # options](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-options.html)
    # in the *Amazon EC2 User Guide*.
    property metadata_options : LaunchTemplateInstanceMetadataOptionsRequest | Nil

    # Indicates whether the instance is enabled for Amazon Web Services Nitro Enclaves. For more
    # information, see [What is Nitro
    # Enclaves?](https://docs.aws.amazon.com/enclaves/latest/user/nitro-enclave.html) in the *Amazon
    # Web Services Nitro Enclaves User Guide*.
    #
    # You can't enable Amazon Web Services Nitro Enclaves and hibernation on the same instance.
    property enclave_options : LaunchTemplateEnclaveOptionsRequest | Nil

    # The attributes for the instance types. When you specify instance attributes, Amazon EC2 will
    # identify instance types with these attributes.
    #
    # You must specify `VCpuCount` and `MemoryMiB`. All other attributes are optional. Any unspecified
    # optional attribute is set to its default.
    #
    # When you specify multiple attributes, you get instance types that satisfy all of the specified
    # attributes. If you specify multiple values for an attribute, you get instance types that satisfy
    # any of the specified values.
    #
    # To limit the list of instance types from which Amazon EC2 can identify matching instance types,
    # you can use one of the following parameters, but not both in the same request:
    #
    # - `AllowedInstanceTypes` - The instance types to include in the list. All other instance types
    # are ignored, even if they match your specified attributes.
    #
    # - `ExcludedInstanceTypes` - The instance types to exclude from the list, even if they match your
    # specified attributes.
    #
    # If you specify `InstanceRequirements`, you can't specify `InstanceType`.
    #
    # Attribute-based instance type selection is only supported when using Auto Scaling groups, EC2
    # Fleet, and Spot Fleet to launch instances. If you plan to use the launch template in the [launch
    # instance
    # wizard](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-instance-wizard.html), or
    # with the
    # [RunInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RunInstances.html) API
    # or
    # [AWS::EC2::Instance](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html)
    # Amazon Web Services CloudFormation resource, you can't specify `InstanceRequirements`.
    #
    # For more information, see [Specify attributes for instance type selection for EC2 Fleet or Spot
    # Fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-attribute-based-instance-type-selection.html)
    # and [Spot placement
    # score](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-placement-score.html) in the
    # *Amazon EC2 User Guide*.
    property instance_requirements : InstanceRequirementsRequest | Nil

    # The options for the instance hostname. The default values are inherited from the subnet.
    property private_dns_name_options : LaunchTemplatePrivateDnsNameOptionsRequest | Nil

    # The maintenance options for the instance.
    property maintenance_options : LaunchTemplateInstanceMaintenanceOptionsRequest | Nil

    # Indicates whether to enable the instance for stop protection. For more information, see [Enable
    # stop protection for your EC2
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-stop-protection.html) in the
    # *Amazon EC2 User Guide*.
    property disable_api_stop : Bool | Nil

    # The entity that manages the launch template.
    property operator : OperatorRequest | Nil

    # Contains launch template settings to boost network performance for the type of workload that
    # runs on your instance.
    property network_performance_options : LaunchTemplateNetworkPerformanceOptionsRequest | Nil

    # The secondary interfaces to associate with instances launched from the template.
    property secondary_interfaces : Array(LaunchTemplateInstanceSecondaryInterfaceSpecificationRequest) | Nil

    def initialize(
      @kernel_id : String | Nil = nil,
      @ebs_optimized : Bool | Nil = nil,
      @iam_instance_profile : LaunchTemplateIamInstanceProfileSpecificationRequest | Nil = nil,
      @block_device_mappings : Array(LaunchTemplateBlockDeviceMappingRequest) | Nil = nil,
      @network_interfaces : Array(LaunchTemplateInstanceNetworkInterfaceSpecificationRequest) | Nil = nil,
      @image_id : String | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @key_name : String | Nil = nil,
      @monitoring : LaunchTemplatesMonitoringRequest | Nil = nil,
      @placement : LaunchTemplatePlacementRequest | Nil = nil,
      @ram_disk_id : String | Nil = nil,
      @disable_api_termination : Bool | Nil = nil,
      @instance_initiated_shutdown_behavior : ShutdownBehavior | Nil = nil,
      @user_data : String | Nil = nil,
      @tag_specifications : Array(LaunchTemplateTagSpecificationRequest) | Nil = nil,
      @elastic_gpu_specifications : Array(ElasticGpuSpecification) | Nil = nil,
      @elastic_inference_accelerators : Array(LaunchTemplateElasticInferenceAccelerator) | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @security_groups : Array(String) | Nil = nil,
      @instance_market_options : LaunchTemplateInstanceMarketOptionsRequest | Nil = nil,
      @credit_specification : CreditSpecificationRequest | Nil = nil,
      @cpu_options : LaunchTemplateCpuOptionsRequest | Nil = nil,
      @capacity_reservation_specification : LaunchTemplateCapacityReservationSpecificationRequest | Nil = nil,
      @license_specifications : Array(LaunchTemplateLicenseConfigurationRequest) | Nil = nil,
      @hibernation_options : LaunchTemplateHibernationOptionsRequest | Nil = nil,
      @metadata_options : LaunchTemplateInstanceMetadataOptionsRequest | Nil = nil,
      @enclave_options : LaunchTemplateEnclaveOptionsRequest | Nil = nil,
      @instance_requirements : InstanceRequirementsRequest | Nil = nil,
      @private_dns_name_options : LaunchTemplatePrivateDnsNameOptionsRequest | Nil = nil,
      @maintenance_options : LaunchTemplateInstanceMaintenanceOptionsRequest | Nil = nil,
      @disable_api_stop : Bool | Nil = nil,
      @operator : OperatorRequest | Nil = nil,
      @network_performance_options : LaunchTemplateNetworkPerformanceOptionsRequest | Nil = nil,
      @secondary_interfaces : Array(LaunchTemplateInstanceSecondaryInterfaceSpecificationRequest) | Nil = nil,
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

      (@block_device_mappings || [] of LaunchTemplateBlockDeviceMappingRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMapping.#{i}."))
      end

      (@network_interfaces || [] of LaunchTemplateInstanceNetworkInterfaceSpecificationRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NetworkInterface.#{i}."))
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

      (@tag_specifications || [] of LaunchTemplateTagSpecificationRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      (@elastic_gpu_specifications || [] of ElasticGpuSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ElasticGpuSpecification.#{i}."))
      end

      (@elastic_inference_accelerators || [] of LaunchTemplateElasticInferenceAccelerator).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ElasticInferenceAccelerator.#{i}."))
      end

      (@security_group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupId.#{i}", item}
      end

      (@security_groups || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroup.#{i}", item}
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

      (@license_specifications || [] of LaunchTemplateLicenseConfigurationRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LicenseSpecification.#{i}."))
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

      (@secondary_interfaces || [] of LaunchTemplateInstanceSecondaryInterfaceSpecificationRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecondaryInterface.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        kernel_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KernelId']")),
        ebs_optimized: Core::XMLValue.bool(node.xpath_node("*[local-name()='EbsOptimized']")),
        iam_instance_profile: node.xpath_node("*[local-name()='IamInstanceProfile']").try { |n| LaunchTemplateIamInstanceProfileSpecificationRequest.from_xml(n) },
        block_device_mappings: node.xpath_nodes("*[local-name()='BlockDeviceMapping']/*[local-name()='BlockDeviceMapping']").map { |n| LaunchTemplateBlockDeviceMappingRequest.from_xml(n) },
        network_interfaces: node.xpath_nodes("*[local-name()='NetworkInterface']/*[local-name()='InstanceNetworkInterfaceSpecification']").map { |n| LaunchTemplateInstanceNetworkInterfaceSpecificationRequest.from_xml(n) },
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")),
        instance_type: (n = node.xpath_node("*[local-name()='InstanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='KeyName']")),
        monitoring: node.xpath_node("*[local-name()='Monitoring']").try { |n| LaunchTemplatesMonitoringRequest.from_xml(n) },
        placement: node.xpath_node("*[local-name()='Placement']").try { |n| LaunchTemplatePlacementRequest.from_xml(n) },
        ram_disk_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RamDiskId']")),
        disable_api_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='DisableApiTermination']")),
        instance_initiated_shutdown_behavior: (n = node.xpath_node("*[local-name()='InstanceInitiatedShutdownBehavior']")) ? AEC::ShutdownBehavior.from_json_object_key?(n.content) : nil,
        user_data: Core::XMLValue.string(node.xpath_node("*[local-name()='UserData']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='LaunchTemplateTagSpecificationRequest']").map { |n| LaunchTemplateTagSpecificationRequest.from_xml(n) },
        elastic_gpu_specifications: node.xpath_nodes("*[local-name()='ElasticGpuSpecification']/*[local-name()='ElasticGpuSpecification']").map { |n| ElasticGpuSpecification.from_xml(n) },
        elastic_inference_accelerators: node.xpath_nodes("*[local-name()='ElasticInferenceAccelerator']/*[local-name()='item']").map { |n| LaunchTemplateElasticInferenceAccelerator.from_xml(n) },
        security_group_ids: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='SecurityGroupId']").map { |n| n.content },
        security_groups: node.xpath_nodes("*[local-name()='SecurityGroup']/*[local-name()='SecurityGroup']").map { |n| n.content },
        instance_market_options: node.xpath_node("*[local-name()='InstanceMarketOptions']").try { |n| LaunchTemplateInstanceMarketOptionsRequest.from_xml(n) },
        credit_specification: node.xpath_node("*[local-name()='CreditSpecification']").try { |n| CreditSpecificationRequest.from_xml(n) },
        cpu_options: node.xpath_node("*[local-name()='CpuOptions']").try { |n| LaunchTemplateCpuOptionsRequest.from_xml(n) },
        capacity_reservation_specification: node.xpath_node("*[local-name()='CapacityReservationSpecification']").try { |n| LaunchTemplateCapacityReservationSpecificationRequest.from_xml(n) },
        license_specifications: node.xpath_nodes("*[local-name()='LicenseSpecification']/*[local-name()='item']").map { |n| LaunchTemplateLicenseConfigurationRequest.from_xml(n) },
        hibernation_options: node.xpath_node("*[local-name()='HibernationOptions']").try { |n| LaunchTemplateHibernationOptionsRequest.from_xml(n) },
        metadata_options: node.xpath_node("*[local-name()='MetadataOptions']").try { |n| LaunchTemplateInstanceMetadataOptionsRequest.from_xml(n) },
        enclave_options: node.xpath_node("*[local-name()='EnclaveOptions']").try { |n| LaunchTemplateEnclaveOptionsRequest.from_xml(n) },
        instance_requirements: node.xpath_node("*[local-name()='InstanceRequirements']").try { |n| InstanceRequirementsRequest.from_xml(n) },
        private_dns_name_options: node.xpath_node("*[local-name()='PrivateDnsNameOptions']").try { |n| LaunchTemplatePrivateDnsNameOptionsRequest.from_xml(n) },
        maintenance_options: node.xpath_node("*[local-name()='MaintenanceOptions']").try { |n| LaunchTemplateInstanceMaintenanceOptionsRequest.from_xml(n) },
        disable_api_stop: Core::XMLValue.bool(node.xpath_node("*[local-name()='DisableApiStop']")),
        operator: node.xpath_node("*[local-name()='Operator']").try { |n| OperatorRequest.from_xml(n) },
        network_performance_options: node.xpath_node("*[local-name()='NetworkPerformanceOptions']").try { |n| LaunchTemplateNetworkPerformanceOptionsRequest.from_xml(n) },
        secondary_interfaces: node.xpath_nodes("*[local-name()='SecondaryInterface']/*[local-name()='InstanceSecondaryInterfaceSpecification']").map { |n| LaunchTemplateInstanceSecondaryInterfaceSpecificationRequest.from_xml(n) },
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
