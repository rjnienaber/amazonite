private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the instance type.
  class InstanceTypeInfo
    # The instance type. For more information, see [Instance
    # types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html) in the *Amazon
    # EC2 User Guide*.
    property instance_type : InstanceType | Nil

    # Indicates whether the instance type is current generation.
    property current_generation : Bool | Nil

    # Indicates whether the instance type is eligible for the free tier.
    property free_tier_eligible : Bool | Nil

    # Indicates whether the instance type is offered for spot, On-Demand, or Capacity Blocks.
    property supported_usage_classes : Array(UsageClassType) | Nil

    # The supported root device types.
    property supported_root_device_types : Array(RootDeviceType) | Nil

    # The supported virtualization types.
    property supported_virtualization_types : Array(VirtualizationType) | Nil

    # Indicates whether the instance is a bare metal instance type.
    property bare_metal : Bool | Nil

    # The hypervisor for the instance type.
    property hypervisor : InstanceTypeHypervisor | Nil

    # Describes the processor.
    property processor_info : ProcessorInfo | Nil

    # Describes the vCPU configurations for the instance type.
    property v_cpu_info : VCpuInfo | Nil

    # Describes the memory for the instance type.
    property memory_info : MemoryInfo | Nil

    # Indicates whether instance storage is supported.
    property instance_storage_supported : Bool | Nil

    # Describes the instance storage for the instance type.
    property instance_storage_info : InstanceStorageInfo | Nil

    # Describes the Amazon EBS settings for the instance type.
    property ebs_info : EbsInfo | Nil

    # Describes the network settings for the instance type.
    property network_info : NetworkInfo | Nil

    # Describes the GPU accelerator settings for the instance type.
    property gpu_info : GpuInfo | Nil

    # Describes the FPGA accelerator settings for the instance type.
    property fpga_info : FpgaInfo | Nil

    # Describes the placement group settings for the instance type.
    property placement_group_info : PlacementGroupInfo | Nil

    # Describes the Inference accelerator settings for the instance type.
    property inference_accelerator_info : InferenceAcceleratorInfo | Nil

    # Indicates whether On-Demand hibernation is supported.
    property hibernation_supported : Bool | Nil

    # Indicates whether the instance type is a burstable performance T instance type. For more
    # information, see [Burstable performance
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html).
    property burstable_performance_supported : Bool | Nil

    # Indicates whether Dedicated Hosts are supported on the instance type.
    property dedicated_hosts_supported : Bool | Nil

    # Indicates whether Amazon CloudWatch action based recovery is supported.
    property auto_recovery_supported : Bool | Nil

    # The supported boot modes. For more information, see [Boot
    # modes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-boot.html) in the *Amazon EC2
    # User Guide*.
    property supported_boot_modes : Array(BootModeType) | Nil

    # Indicates whether Nitro Enclaves is supported.
    property nitro_enclaves_support : NitroEnclavesSupport | Nil

    # Indicates whether NitroTPM is supported.
    property nitro_tpm_support : NitroTpmSupport | Nil

    # Describes the supported NitroTPM versions for the instance type.
    property nitro_tpm_info : NitroTpmInfo | Nil

    # Describes the media accelerator settings for the instance type.
    property media_accelerator_info : MediaAcceleratorInfo | Nil

    # Describes the Neuron accelerator settings for the instance type.
    property neuron_info : NeuronInfo | Nil

    # Indicates whether a local Precision Time Protocol (PTP) hardware clock (PHC) is supported.
    property phc_support : PhcSupport | Nil

    # Indicates whether reboot migration during a user-initiated reboot is supported for instances
    # that have a scheduled `system-reboot` event. For more information, see [Enable or disable reboot
    # migration](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/schedevents_actions_reboot.html#reboot-migration)
    # in the *Amazon EC2 User Guide*.
    property reboot_migration_support : RebootMigrationSupport | Nil

    # Indicates whether the instance type is supported in the current Region.
    property supported_in_region : Bool | Nil

    def initialize(
      @instance_type : InstanceType | Nil = nil,
      @current_generation : Bool | Nil = nil,
      @free_tier_eligible : Bool | Nil = nil,
      @supported_usage_classes : Array(UsageClassType) | Nil = nil,
      @supported_root_device_types : Array(RootDeviceType) | Nil = nil,
      @supported_virtualization_types : Array(VirtualizationType) | Nil = nil,
      @bare_metal : Bool | Nil = nil,
      @hypervisor : InstanceTypeHypervisor | Nil = nil,
      @processor_info : ProcessorInfo | Nil = nil,
      @v_cpu_info : VCpuInfo | Nil = nil,
      @memory_info : MemoryInfo | Nil = nil,
      @instance_storage_supported : Bool | Nil = nil,
      @instance_storage_info : InstanceStorageInfo | Nil = nil,
      @ebs_info : EbsInfo | Nil = nil,
      @network_info : NetworkInfo | Nil = nil,
      @gpu_info : GpuInfo | Nil = nil,
      @fpga_info : FpgaInfo | Nil = nil,
      @placement_group_info : PlacementGroupInfo | Nil = nil,
      @inference_accelerator_info : InferenceAcceleratorInfo | Nil = nil,
      @hibernation_supported : Bool | Nil = nil,
      @burstable_performance_supported : Bool | Nil = nil,
      @dedicated_hosts_supported : Bool | Nil = nil,
      @auto_recovery_supported : Bool | Nil = nil,
      @supported_boot_modes : Array(BootModeType) | Nil = nil,
      @nitro_enclaves_support : NitroEnclavesSupport | Nil = nil,
      @nitro_tpm_support : NitroTpmSupport | Nil = nil,
      @nitro_tpm_info : NitroTpmInfo | Nil = nil,
      @media_accelerator_info : MediaAcceleratorInfo | Nil = nil,
      @neuron_info : NeuronInfo | Nil = nil,
      @phc_support : PhcSupport | Nil = nil,
      @reboot_migration_support : RebootMigrationSupport | Nil = nil,
      @supported_in_region : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @current_generation
        params << {"#{prefix}CurrentGeneration", Core::QueryValue.bool(value)}
      end

      if value = @free_tier_eligible
        params << {"#{prefix}FreeTierEligible", Core::QueryValue.bool(value)}
      end

      (@supported_usage_classes || [] of UsageClassType).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedUsageClasses.#{i}", item.to_json_object_key}
      end

      (@supported_root_device_types || [] of RootDeviceType).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedRootDeviceTypes.#{i}", item.to_json_object_key}
      end

      (@supported_virtualization_types || [] of VirtualizationType).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedVirtualizationTypes.#{i}", item.to_json_object_key}
      end

      if value = @bare_metal
        params << {"#{prefix}BareMetal", Core::QueryValue.bool(value)}
      end

      if value = @hypervisor
        params << {"#{prefix}Hypervisor", value.to_json_object_key}
      end

      if value = @processor_info
        params.concat(value.to_query_params("#{prefix}ProcessorInfo."))
      end

      if value = @v_cpu_info
        params.concat(value.to_query_params("#{prefix}VCpuInfo."))
      end

      if value = @memory_info
        params.concat(value.to_query_params("#{prefix}MemoryInfo."))
      end

      if value = @instance_storage_supported
        params << {"#{prefix}InstanceStorageSupported", Core::QueryValue.bool(value)}
      end

      if value = @instance_storage_info
        params.concat(value.to_query_params("#{prefix}InstanceStorageInfo."))
      end

      if value = @ebs_info
        params.concat(value.to_query_params("#{prefix}EbsInfo."))
      end

      if value = @network_info
        params.concat(value.to_query_params("#{prefix}NetworkInfo."))
      end

      if value = @gpu_info
        params.concat(value.to_query_params("#{prefix}GpuInfo."))
      end

      if value = @fpga_info
        params.concat(value.to_query_params("#{prefix}FpgaInfo."))
      end

      if value = @placement_group_info
        params.concat(value.to_query_params("#{prefix}PlacementGroupInfo."))
      end

      if value = @inference_accelerator_info
        params.concat(value.to_query_params("#{prefix}InferenceAcceleratorInfo."))
      end

      if value = @hibernation_supported
        params << {"#{prefix}HibernationSupported", Core::QueryValue.bool(value)}
      end

      if value = @burstable_performance_supported
        params << {"#{prefix}BurstablePerformanceSupported", Core::QueryValue.bool(value)}
      end

      if value = @dedicated_hosts_supported
        params << {"#{prefix}DedicatedHostsSupported", Core::QueryValue.bool(value)}
      end

      if value = @auto_recovery_supported
        params << {"#{prefix}AutoRecoverySupported", Core::QueryValue.bool(value)}
      end

      (@supported_boot_modes || [] of BootModeType).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedBootModes.#{i}", item.to_json_object_key}
      end

      if value = @nitro_enclaves_support
        params << {"#{prefix}NitroEnclavesSupport", value.to_json_object_key}
      end

      if value = @nitro_tpm_support
        params << {"#{prefix}NitroTpmSupport", value.to_json_object_key}
      end

      if value = @nitro_tpm_info
        params.concat(value.to_query_params("#{prefix}NitroTpmInfo."))
      end

      if value = @media_accelerator_info
        params.concat(value.to_query_params("#{prefix}MediaAcceleratorInfo."))
      end

      if value = @neuron_info
        params.concat(value.to_query_params("#{prefix}NeuronInfo."))
      end

      if value = @phc_support
        params << {"#{prefix}PhcSupport", value.to_json_object_key}
      end

      if value = @reboot_migration_support
        params << {"#{prefix}RebootMigrationSupport", value.to_json_object_key}
      end

      if value = @supported_in_region
        params << {"#{prefix}SupportedInRegion", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        current_generation: Core::XMLValue.bool(node.xpath_node("*[local-name()='currentGeneration']")),
        free_tier_eligible: Core::XMLValue.bool(node.xpath_node("*[local-name()='freeTierEligible']")),
        supported_usage_classes: node.xpath_nodes("*[local-name()='supportedUsageClasses']/*[local-name()='item']").compact_map { |n| AEC::UsageClassType.from_json_object_key?(n.content) },
        supported_root_device_types: node.xpath_nodes("*[local-name()='supportedRootDeviceTypes']/*[local-name()='item']").compact_map { |n| AEC::RootDeviceType.from_json_object_key?(n.content) },
        supported_virtualization_types: node.xpath_nodes("*[local-name()='supportedVirtualizationTypes']/*[local-name()='item']").compact_map { |n| AEC::VirtualizationType.from_json_object_key?(n.content) },
        bare_metal: Core::XMLValue.bool(node.xpath_node("*[local-name()='bareMetal']")),
        hypervisor: (n = node.xpath_node("*[local-name()='hypervisor']")) ? AEC::InstanceTypeHypervisor.from_json_object_key?(n.content) : nil,
        processor_info: node.xpath_node("*[local-name()='processorInfo']").try { |n| ProcessorInfo.from_xml(n) },
        v_cpu_info: node.xpath_node("*[local-name()='vCpuInfo']").try { |n| VCpuInfo.from_xml(n) },
        memory_info: node.xpath_node("*[local-name()='memoryInfo']").try { |n| MemoryInfo.from_xml(n) },
        instance_storage_supported: Core::XMLValue.bool(node.xpath_node("*[local-name()='instanceStorageSupported']")),
        instance_storage_info: node.xpath_node("*[local-name()='instanceStorageInfo']").try { |n| InstanceStorageInfo.from_xml(n) },
        ebs_info: node.xpath_node("*[local-name()='ebsInfo']").try { |n| EbsInfo.from_xml(n) },
        network_info: node.xpath_node("*[local-name()='networkInfo']").try { |n| NetworkInfo.from_xml(n) },
        gpu_info: node.xpath_node("*[local-name()='gpuInfo']").try { |n| GpuInfo.from_xml(n) },
        fpga_info: node.xpath_node("*[local-name()='fpgaInfo']").try { |n| FpgaInfo.from_xml(n) },
        placement_group_info: node.xpath_node("*[local-name()='placementGroupInfo']").try { |n| PlacementGroupInfo.from_xml(n) },
        inference_accelerator_info: node.xpath_node("*[local-name()='inferenceAcceleratorInfo']").try { |n| InferenceAcceleratorInfo.from_xml(n) },
        hibernation_supported: Core::XMLValue.bool(node.xpath_node("*[local-name()='hibernationSupported']")),
        burstable_performance_supported: Core::XMLValue.bool(node.xpath_node("*[local-name()='burstablePerformanceSupported']")),
        dedicated_hosts_supported: Core::XMLValue.bool(node.xpath_node("*[local-name()='dedicatedHostsSupported']")),
        auto_recovery_supported: Core::XMLValue.bool(node.xpath_node("*[local-name()='autoRecoverySupported']")),
        supported_boot_modes: node.xpath_nodes("*[local-name()='supportedBootModes']/*[local-name()='item']").compact_map { |n| AEC::BootModeType.from_json_object_key?(n.content) },
        nitro_enclaves_support: (n = node.xpath_node("*[local-name()='nitroEnclavesSupport']")) ? AEC::NitroEnclavesSupport.from_json_object_key?(n.content) : nil,
        nitro_tpm_support: (n = node.xpath_node("*[local-name()='nitroTpmSupport']")) ? AEC::NitroTpmSupport.from_json_object_key?(n.content) : nil,
        nitro_tpm_info: node.xpath_node("*[local-name()='nitroTpmInfo']").try { |n| NitroTpmInfo.from_xml(n) },
        media_accelerator_info: node.xpath_node("*[local-name()='mediaAcceleratorInfo']").try { |n| MediaAcceleratorInfo.from_xml(n) },
        neuron_info: node.xpath_node("*[local-name()='neuronInfo']").try { |n| NeuronInfo.from_xml(n) },
        phc_support: (n = node.xpath_node("*[local-name()='phcSupport']")) ? AEC::PhcSupport.from_json_object_key?(n.content) : nil,
        reboot_migration_support: (n = node.xpath_node("*[local-name()='rebootMigrationSupport']")) ? AEC::RebootMigrationSupport.from_json_object_key?(n.content) : nil,
        supported_in_region: Core::XMLValue.bool(node.xpath_node("*[local-name()='supportedInRegion']")),
      )
    end

    def validate! : Nil
      if value = @processor_info
        value.validate!
      end

      if value = @v_cpu_info
        value.validate!
      end

      if value = @memory_info
        value.validate!
      end

      if value = @instance_storage_info
        value.validate!
      end

      if value = @ebs_info
        value.validate!
      end

      if value = @network_info
        value.validate!
      end

      if value = @gpu_info
        value.validate!
      end

      if value = @fpga_info
        value.validate!
      end

      if value = @placement_group_info
        value.validate!
      end

      if value = @inference_accelerator_info
        value.validate!
      end

      if value = @nitro_tpm_info
        value.validate!
      end

      if value = @media_accelerator_info
        value.validate!
      end

      if value = @neuron_info
        value.validate!
      end
    end

    def_equals_and_hash(@instance_type, @current_generation, @free_tier_eligible, @supported_usage_classes, @supported_root_device_types, @supported_virtualization_types, @bare_metal, @hypervisor, @processor_info, @v_cpu_info, @memory_info, @instance_storage_supported, @instance_storage_info, @ebs_info, @network_info, @gpu_info, @fpga_info, @placement_group_info, @inference_accelerator_info, @hibernation_supported, @burstable_performance_supported, @dedicated_hosts_supported, @auto_recovery_supported, @supported_boot_modes, @nitro_enclaves_support, @nitro_tpm_support, @nitro_tpm_info, @media_accelerator_info, @neuron_info, @phc_support, @reboot_migration_support, @supported_in_region)
  end
end
