private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
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
  # wizard](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-instance-wizard.html) or
  # with the [RunInstances
  # API](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RunInstances.html), you can't
  # specify `InstanceRequirements`.
  #
  # For more information, see [Create mixed instances group using attribute-based instance type
  # selection](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-mixed-instances-group-attribute-based-instance-type-selection.html)
  # in the *Amazon EC2 Auto Scaling User Guide*, and also [Specify attributes for instance type
  # selection for EC2 Fleet or Spot
  # Fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-attribute-based-instance-type-selection.html)
  # and [Spot placement
  # score](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-placement-score.html) in the
  # *Amazon EC2 User Guide*.
  class InstanceRequirements
    # The minimum and maximum number of vCPUs.
    property v_cpu_count : VCpuCountRange | Nil

    # The minimum and maximum amount of memory, in MiB.
    property memory_mi_b : MemoryMiB | Nil

    # The CPU manufacturers to include.
    #
    # - For instance types with Intel CPUs, specify `intel`.
    #
    # - For instance types with AMD CPUs, specify `amd`.
    #
    # - For instance types with Amazon Web Services CPUs, specify `amazon-web-services`.
    #
    # - For instance types with Apple CPUs, specify `apple`.
    #
    # Don't confuse the CPU manufacturer with the CPU architecture. Instances will be launched with a
    # compatible CPU architecture based on the Amazon Machine Image (AMI) that you specify in your
    # launch template.
    #
    # Default: Any manufacturer
    property cpu_manufacturers : Array(CpuManufacturer) | Nil

    # The minimum and maximum amount of memory per vCPU, in GiB.
    #
    # Default: No minimum or maximum limits
    property memory_gi_b_per_v_cpu : MemoryGiBPerVCpu | Nil

    # The instance types to exclude.
    #
    # You can use strings with one or more wild cards, represented by an asterisk (`*`), to exclude an
    # instance type, size, or generation. The following are examples: `m5.8xlarge`, `c5*.*`, `m5a.*`,
    # `r*`, `*3*`.
    #
    # For example, if you specify `c5*`,Amazon EC2 will exclude the entire C5 instance family, which
    # includes all C5a and C5n instance types. If you specify `m5a.*`, Amazon EC2 will exclude all the
    # M5a instance types, but not the M5n instance types.
    #
    # If you specify `ExcludedInstanceTypes`, you can't specify `AllowedInstanceTypes`.
    #
    # Default: No excluded instance types
    property excluded_instance_types : Array(String) | Nil

    # Indicates whether current or previous generation instance types are included. The current
    # generation instance types are recommended for use. Current generation instance types are
    # typically the latest two to three generations in each instance family. For more information, see
    # [Instance types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html) in the
    # *Amazon EC2 User Guide*.
    #
    # For current generation instance types, specify `current`.
    #
    # For previous generation instance types, specify `previous`.
    #
    # Default: Current and previous generation instance types
    property instance_generations : Array(InstanceGeneration) | Nil

    # [Price protection] The price protection threshold for Spot Instances, as a percentage higher
    # than an identified Spot price. The identified Spot price is the Spot price of the lowest priced
    # current generation C, M, or R instance type with your specified attributes. If no current
    # generation C, M, or R instance type matches your attributes, then the identified Spot price is
    # from the lowest priced current generation instance types, and failing that, from the lowest
    # priced previous generation instance types that match your attributes. When Amazon EC2 selects
    # instance types with your attributes, it will exclude instance types whose Spot price exceeds
    # your specified threshold.
    #
    # The parameter accepts an integer, which Amazon EC2 interprets as a percentage.
    #
    # If you set `TargetCapacityUnitType` to `vcpu` or `memory-mib`, the price protection threshold is
    # applied based on the per-vCPU or per-memory price instead of the per-instance price.
    #
    # This parameter is not supported for
    # [GetSpotPlacementScores](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_GetSpotPlacementScores.html)
    # and
    # [GetInstanceTypesFromInstanceRequirements](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_GetInstanceTypesFromInstanceRequirements.html).
    #
    # Only one of `SpotMaxPricePercentageOverLowestPrice` or
    # `MaxSpotPriceAsPercentageOfOptimalOnDemandPrice` can be specified. If you don't specify either,
    # Amazon EC2 will automatically apply optimal price protection to consistently select from a wide
    # range of instance types. To indicate no price protection threshold for Spot Instances, meaning
    # you want to consider all instance types that match your attributes, include one of these
    # parameters and specify a high value, such as `999999`.
    #
    # Default: `100`
    property spot_max_price_percentage_over_lowest_price : Int32 | Nil

    # [Price protection] The price protection threshold for On-Demand Instances, as a percentage
    # higher than an identified On-Demand price. The identified On-Demand price is the price of the
    # lowest priced current generation C, M, or R instance type with your specified attributes. When
    # Amazon EC2 selects instance types with your attributes, it will exclude instance types whose
    # price exceeds your specified threshold.
    #
    # The parameter accepts an integer, which Amazon EC2 interprets as a percentage.
    #
    # To turn off price protection, specify a high value, such as `999999`.
    #
    # This parameter is not supported for
    # [GetSpotPlacementScores](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_GetSpotPlacementScores.html)
    # and
    # [GetInstanceTypesFromInstanceRequirements](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_GetInstanceTypesFromInstanceRequirements.html).
    #
    # If you set `TargetCapacityUnitType` to `vcpu` or `memory-mib`, the price protection threshold is
    # applied based on the per-vCPU or per-memory price instead of the per-instance price.
    #
    # Default: `20`
    property on_demand_max_price_percentage_over_lowest_price : Int32 | Nil

    # Indicates whether bare metal instance types must be included, excluded, or required.
    #
    # - To include bare metal instance types, specify `included`.
    #
    # - To require only bare metal instance types, specify `required`.
    #
    # - To exclude bare metal instance types, specify `excluded`.
    #
    # Default: `excluded`
    property bare_metal : BareMetal | Nil

    # Indicates whether burstable performance T instance types are included, excluded, or required.
    # For more information, see [Burstable performance
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html).
    #
    # - To include burstable performance instance types, specify `included`.
    #
    # - To require only burstable performance instance types, specify `required`.
    #
    # - To exclude burstable performance instance types, specify `excluded`.
    #
    # Default: `excluded`
    property burstable_performance : BurstablePerformance | Nil

    # Indicates whether instance types must support hibernation for On-Demand Instances.
    #
    # This parameter is not supported for
    # [GetSpotPlacementScores](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_GetSpotPlacementScores.html).
    #
    # Default: `false`
    property require_hibernate_support : Bool | Nil

    # The minimum and maximum number of network interfaces.
    #
    # Default: No minimum or maximum limits
    property network_interface_count : NetworkInterfaceCount | Nil

    # Indicates whether instance types with instance store volumes are included, excluded, or
    # required. For more information, [Amazon EC2 instance
    # store](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html) in the *Amazon
    # EC2 User Guide*.
    #
    # - To include instance types with instance store volumes, specify `included`.
    #
    # - To require only instance types with instance store volumes, specify `required`.
    #
    # - To exclude instance types with instance store volumes, specify `excluded`.
    #
    # Default: `included`
    property local_storage : LocalStorage | Nil

    # The type of local storage that is required.
    #
    # - For instance types with hard disk drive (HDD) storage, specify `hdd`.
    #
    # - For instance types with solid state drive (SSD) storage, specify `ssd`.
    #
    # Default: `hdd` and `ssd`
    property local_storage_types : Array(LocalStorageType) | Nil

    # The minimum and maximum amount of total local storage, in GB.
    #
    # Default: No minimum or maximum limits
    property total_local_storage_gb : TotalLocalStorageGB | Nil

    # The minimum and maximum baseline bandwidth to Amazon EBS, in Mbps. For more information, see
    # [Amazon EBS–optimized
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-optimized.html) in the
    # *Amazon EC2 User Guide*.
    #
    # Default: No minimum or maximum limits
    property baseline_ebs_bandwidth_mbps : BaselineEbsBandwidthMbps | Nil

    # The accelerator types that must be on the instance type.
    #
    # - For instance types with FPGA accelerators, specify `fpga`.
    #
    # - For instance types with GPU accelerators, specify `gpu`.
    #
    # - For instance types with Inference accelerators, specify `inference`.
    #
    # - For instance types with Media accelerators, specify `media`.
    #
    # Default: Any accelerator type
    property accelerator_types : Array(AcceleratorType) | Nil

    # The minimum and maximum number of accelerators (GPUs, FPGAs, or Amazon Web Services Inferentia
    # chips) on an instance.
    #
    # To exclude accelerator-enabled instance types, set `Max` to `0`.
    #
    # Default: No minimum or maximum limits
    property accelerator_count : AcceleratorCount | Nil

    # Indicates whether instance types must have accelerators by specific manufacturers.
    #
    # - For instance types with Amazon Web Services devices, specify `amazon-web-services`.
    #
    # - For instance types with AMD devices, specify `amd`.
    #
    # - For instance types with Habana devices, specify `habana`.
    #
    # - For instance types with NVIDIA devices, specify `nvidia`.
    #
    # - For instance types with Xilinx devices, specify `xilinx`.
    #
    # Default: Any manufacturer
    property accelerator_manufacturers : Array(AcceleratorManufacturer) | Nil

    # The accelerators that must be on the instance type.
    #
    # - For instance types with NVIDIA A10G GPUs, specify `a10g`.
    #
    # - For instance types with NVIDIA A100 GPUs, specify `a100`.
    #
    # - For instance types with NVIDIA H100 GPUs, specify `h100`.
    #
    # - For instance types with Amazon Web Services Inferentia chips, specify `inferentia`.
    #
    # - For instance types with Amazon Web Services Inferentia2 chips, specify `inferentia2`.
    #
    # - For instance types with Habana Gaudi HL-205 GPUs, specify `gaudi-hl-205`.
    #
    # - For instance types with NVIDIA GRID K520 GPUs, specify `k520`.
    #
    # - For instance types with NVIDIA K80 GPUs, specify `k80`.
    #
    # - For instance types with NVIDIA L4 GPUs, specify `l4`.
    #
    # - For instance types with NVIDIA L40S GPUs, specify `l40s`.
    #
    # - For instance types with NVIDIA M60 GPUs, specify `m60`.
    #
    # - For instance types with AMD Radeon Pro V520 GPUs, specify `radeon-pro-v520`.
    #
    # - For instance types with Amazon Web Services Trainium chips, specify `trainium`.
    #
    # - For instance types with Amazon Web Services Trainium2 chips, specify `trainium2`.
    #
    # - For instance types with NVIDIA T4 GPUs, specify `t4`.
    #
    # - For instance types with NVIDIA T4G GPUs, specify `t4g`.
    #
    # - For instance types with Xilinx U30 cards, specify `u30`.
    #
    # - For instance types with Xilinx VU9P FPGAs, specify `vu9p`.
    #
    # - For instance types with NVIDIA V100 GPUs, specify `v100`.
    #
    # Default: Any accelerator
    property accelerator_names : Array(AcceleratorName) | Nil

    # The minimum and maximum amount of total accelerator memory, in MiB.
    #
    # Default: No minimum or maximum limits
    property accelerator_total_memory_mi_b : AcceleratorTotalMemoryMiB | Nil

    # The minimum and maximum amount of network bandwidth, in gigabits per second (Gbps).
    #
    # Default: No minimum or maximum limits
    property network_bandwidth_gbps : NetworkBandwidthGbps | Nil

    # The instance types to apply your specified attributes against. All other instance types are
    # ignored, even if they match your specified attributes.
    #
    # You can use strings with one or more wild cards, represented by an asterisk (`*`), to allow an
    # instance type, size, or generation. The following are examples: `m5.8xlarge`, `c5*.*`, `m5a.*`,
    # `r*`, `*3*`.
    #
    # For example, if you specify `c5*`,Amazon EC2 will allow the entire C5 instance family, which
    # includes all C5a and C5n instance types. If you specify `m5a.*`, Amazon EC2 will allow all the
    # M5a instance types, but not the M5n instance types.
    #
    # If you specify `AllowedInstanceTypes`, you can't specify `ExcludedInstanceTypes`.
    #
    # Default: All instance types
    property allowed_instance_types : Array(String) | Nil

    # [Price protection] The price protection threshold for Spot Instances, as a percentage of an
    # identified On-Demand price. The identified On-Demand price is the price of the lowest priced
    # current generation C, M, or R instance type with your specified attributes. If no current
    # generation C, M, or R instance type matches your attributes, then the identified price is from
    # the lowest priced current generation instance types, and failing that, from the lowest priced
    # previous generation instance types that match your attributes. When Amazon EC2 selects instance
    # types with your attributes, it will exclude instance types whose price exceeds your specified
    # threshold.
    #
    # The parameter accepts an integer, which Amazon EC2 interprets as a percentage.
    #
    # If you set `TargetCapacityUnitType` to `vcpu` or `memory-mib`, the price protection threshold is
    # based on the per vCPU or per memory price instead of the per instance price.
    #
    # Only one of `SpotMaxPricePercentageOverLowestPrice` or
    # `MaxSpotPriceAsPercentageOfOptimalOnDemandPrice` can be specified. If you don't specify either,
    # Amazon EC2 will automatically apply optimal price protection to consistently select from a wide
    # range of instance types. To indicate no price protection threshold for Spot Instances, meaning
    # you want to consider all instance types that match your attributes, include one of these
    # parameters and specify a high value, such as `999999`.
    property max_spot_price_as_percentage_of_optimal_on_demand_price : Int32 | Nil

    # The baseline performance to consider, using an instance family as a baseline reference. The
    # instance family establishes the lowest acceptable level of performance. Amazon EC2 uses this
    # baseline to guide instance type selection, but there is no guarantee that the selected instance
    # types will always exceed the baseline for every application. Currently, this parameter only
    # supports CPU performance as a baseline performance factor. For more information, see
    # [Performance
    # protection](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-attribute-based-instance-type-selection.html#ec2fleet-abis-performance-protection)
    # in the *Amazon EC2 User Guide*.
    property baseline_performance_factors : BaselinePerformanceFactors | Nil

    # Specifies whether instance types must support encrypting in-transit traffic between instances.
    # For more information, including the supported instance types, see [Encryption in
    # transit](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/data-protection.html#encryption-transit)
    # in the *Amazon EC2 User Guide*.
    #
    # Default: `false`
    property require_encryption_in_transit : Bool | Nil

    def initialize(
      @v_cpu_count : VCpuCountRange | Nil = nil,
      @memory_mi_b : MemoryMiB | Nil = nil,
      @cpu_manufacturers : Array(CpuManufacturer) | Nil = nil,
      @memory_gi_b_per_v_cpu : MemoryGiBPerVCpu | Nil = nil,
      @excluded_instance_types : Array(String) | Nil = nil,
      @instance_generations : Array(InstanceGeneration) | Nil = nil,
      @spot_max_price_percentage_over_lowest_price : Int32 | Nil = nil,
      @on_demand_max_price_percentage_over_lowest_price : Int32 | Nil = nil,
      @bare_metal : BareMetal | Nil = nil,
      @burstable_performance : BurstablePerformance | Nil = nil,
      @require_hibernate_support : Bool | Nil = nil,
      @network_interface_count : NetworkInterfaceCount | Nil = nil,
      @local_storage : LocalStorage | Nil = nil,
      @local_storage_types : Array(LocalStorageType) | Nil = nil,
      @total_local_storage_gb : TotalLocalStorageGB | Nil = nil,
      @baseline_ebs_bandwidth_mbps : BaselineEbsBandwidthMbps | Nil = nil,
      @accelerator_types : Array(AcceleratorType) | Nil = nil,
      @accelerator_count : AcceleratorCount | Nil = nil,
      @accelerator_manufacturers : Array(AcceleratorManufacturer) | Nil = nil,
      @accelerator_names : Array(AcceleratorName) | Nil = nil,
      @accelerator_total_memory_mi_b : AcceleratorTotalMemoryMiB | Nil = nil,
      @network_bandwidth_gbps : NetworkBandwidthGbps | Nil = nil,
      @allowed_instance_types : Array(String) | Nil = nil,
      @max_spot_price_as_percentage_of_optimal_on_demand_price : Int32 | Nil = nil,
      @baseline_performance_factors : BaselinePerformanceFactors | Nil = nil,
      @require_encryption_in_transit : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @v_cpu_count
        params.concat(value.to_query_params("#{prefix}VCpuCount."))
      end

      if value = @memory_mi_b
        params.concat(value.to_query_params("#{prefix}MemoryMiB."))
      end

      (@cpu_manufacturers || [] of CpuManufacturer).each_with_index(1) do |item, i|
        params << {"#{prefix}CpuManufacturerSet.#{i}", item.to_json_object_key}
      end

      if value = @memory_gi_b_per_v_cpu
        params.concat(value.to_query_params("#{prefix}MemoryGiBPerVCpu."))
      end

      (@excluded_instance_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ExcludedInstanceTypeSet.#{i}", item}
      end

      (@instance_generations || [] of InstanceGeneration).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceGenerationSet.#{i}", item.to_json_object_key}
      end

      if value = @spot_max_price_percentage_over_lowest_price
        params << {"#{prefix}SpotMaxPricePercentageOverLowestPrice", value.to_s}
      end

      if value = @on_demand_max_price_percentage_over_lowest_price
        params << {"#{prefix}OnDemandMaxPricePercentageOverLowestPrice", value.to_s}
      end

      if value = @bare_metal
        params << {"#{prefix}BareMetal", value.to_json_object_key}
      end

      if value = @burstable_performance
        params << {"#{prefix}BurstablePerformance", value.to_json_object_key}
      end

      if value = @require_hibernate_support
        params << {"#{prefix}RequireHibernateSupport", Core::QueryValue.bool(value)}
      end

      if value = @network_interface_count
        params.concat(value.to_query_params("#{prefix}NetworkInterfaceCount."))
      end

      if value = @local_storage
        params << {"#{prefix}LocalStorage", value.to_json_object_key}
      end

      (@local_storage_types || [] of LocalStorageType).each_with_index(1) do |item, i|
        params << {"#{prefix}LocalStorageTypeSet.#{i}", item.to_json_object_key}
      end

      if value = @total_local_storage_gb
        params.concat(value.to_query_params("#{prefix}TotalLocalStorageGB."))
      end

      if value = @baseline_ebs_bandwidth_mbps
        params.concat(value.to_query_params("#{prefix}BaselineEbsBandwidthMbps."))
      end

      (@accelerator_types || [] of AcceleratorType).each_with_index(1) do |item, i|
        params << {"#{prefix}AcceleratorTypeSet.#{i}", item.to_json_object_key}
      end

      if value = @accelerator_count
        params.concat(value.to_query_params("#{prefix}AcceleratorCount."))
      end

      (@accelerator_manufacturers || [] of AcceleratorManufacturer).each_with_index(1) do |item, i|
        params << {"#{prefix}AcceleratorManufacturerSet.#{i}", item.to_json_object_key}
      end

      (@accelerator_names || [] of AcceleratorName).each_with_index(1) do |item, i|
        params << {"#{prefix}AcceleratorNameSet.#{i}", item.to_json_object_key}
      end

      if value = @accelerator_total_memory_mi_b
        params.concat(value.to_query_params("#{prefix}AcceleratorTotalMemoryMiB."))
      end

      if value = @network_bandwidth_gbps
        params.concat(value.to_query_params("#{prefix}NetworkBandwidthGbps."))
      end

      (@allowed_instance_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AllowedInstanceTypeSet.#{i}", item}
      end

      if value = @max_spot_price_as_percentage_of_optimal_on_demand_price
        params << {"#{prefix}MaxSpotPriceAsPercentageOfOptimalOnDemandPrice", value.to_s}
      end

      if value = @baseline_performance_factors
        params.concat(value.to_query_params("#{prefix}BaselinePerformanceFactors."))
      end

      if value = @require_encryption_in_transit
        params << {"#{prefix}RequireEncryptionInTransit", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        v_cpu_count: node.xpath_node("*[local-name()='vCpuCount']").try { |n| VCpuCountRange.from_xml(n) },
        memory_mi_b: node.xpath_node("*[local-name()='memoryMiB']").try { |n| MemoryMiB.from_xml(n) },
        cpu_manufacturers: node.xpath_nodes("*[local-name()='cpuManufacturerSet']/*[local-name()='item']").compact_map { |n| AEC::CpuManufacturer.from_json_object_key?(n.content) },
        memory_gi_b_per_v_cpu: node.xpath_node("*[local-name()='memoryGiBPerVCpu']").try { |n| MemoryGiBPerVCpu.from_xml(n) },
        excluded_instance_types: node.xpath_nodes("*[local-name()='excludedInstanceTypeSet']/*[local-name()='item']").map { |n| n.content },
        instance_generations: node.xpath_nodes("*[local-name()='instanceGenerationSet']/*[local-name()='item']").compact_map { |n| AEC::InstanceGeneration.from_json_object_key?(n.content) },
        spot_max_price_percentage_over_lowest_price: Core::XMLValue.i32(node.xpath_node("*[local-name()='spotMaxPricePercentageOverLowestPrice']")),
        on_demand_max_price_percentage_over_lowest_price: Core::XMLValue.i32(node.xpath_node("*[local-name()='onDemandMaxPricePercentageOverLowestPrice']")),
        bare_metal: (n = node.xpath_node("*[local-name()='bareMetal']")) ? AEC::BareMetal.from_json_object_key?(n.content) : nil,
        burstable_performance: (n = node.xpath_node("*[local-name()='burstablePerformance']")) ? AEC::BurstablePerformance.from_json_object_key?(n.content) : nil,
        require_hibernate_support: Core::XMLValue.bool(node.xpath_node("*[local-name()='requireHibernateSupport']")),
        network_interface_count: node.xpath_node("*[local-name()='networkInterfaceCount']").try { |n| NetworkInterfaceCount.from_xml(n) },
        local_storage: (n = node.xpath_node("*[local-name()='localStorage']")) ? AEC::LocalStorage.from_json_object_key?(n.content) : nil,
        local_storage_types: node.xpath_nodes("*[local-name()='localStorageTypeSet']/*[local-name()='item']").compact_map { |n| AEC::LocalStorageType.from_json_object_key?(n.content) },
        total_local_storage_gb: node.xpath_node("*[local-name()='totalLocalStorageGB']").try { |n| TotalLocalStorageGB.from_xml(n) },
        baseline_ebs_bandwidth_mbps: node.xpath_node("*[local-name()='baselineEbsBandwidthMbps']").try { |n| BaselineEbsBandwidthMbps.from_xml(n) },
        accelerator_types: node.xpath_nodes("*[local-name()='acceleratorTypeSet']/*[local-name()='item']").compact_map { |n| AEC::AcceleratorType.from_json_object_key?(n.content) },
        accelerator_count: node.xpath_node("*[local-name()='acceleratorCount']").try { |n| AcceleratorCount.from_xml(n) },
        accelerator_manufacturers: node.xpath_nodes("*[local-name()='acceleratorManufacturerSet']/*[local-name()='item']").compact_map { |n| AEC::AcceleratorManufacturer.from_json_object_key?(n.content) },
        accelerator_names: node.xpath_nodes("*[local-name()='acceleratorNameSet']/*[local-name()='item']").compact_map { |n| AEC::AcceleratorName.from_json_object_key?(n.content) },
        accelerator_total_memory_mi_b: node.xpath_node("*[local-name()='acceleratorTotalMemoryMiB']").try { |n| AcceleratorTotalMemoryMiB.from_xml(n) },
        network_bandwidth_gbps: node.xpath_node("*[local-name()='networkBandwidthGbps']").try { |n| NetworkBandwidthGbps.from_xml(n) },
        allowed_instance_types: node.xpath_nodes("*[local-name()='allowedInstanceTypeSet']/*[local-name()='item']").map { |n| n.content },
        max_spot_price_as_percentage_of_optimal_on_demand_price: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxSpotPriceAsPercentageOfOptimalOnDemandPrice']")),
        baseline_performance_factors: node.xpath_node("*[local-name()='baselinePerformanceFactors']").try { |n| BaselinePerformanceFactors.from_xml(n) },
        require_encryption_in_transit: Core::XMLValue.bool(node.xpath_node("*[local-name()='requireEncryptionInTransit']")),
      )
    end

    def validate! : Nil
      if value = @v_cpu_count
        value.validate!
      end

      if value = @memory_mi_b
        value.validate!
      end

      if value = @memory_gi_b_per_v_cpu
        value.validate!
      end

      if value = @excluded_instance_types
        raise Core::ValidationError.new("ExcludedInstanceTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("ExcludedInstanceTypes must have at most 400 item(s)") if value.size > 400
      end

      if value = @network_interface_count
        value.validate!
      end

      if value = @total_local_storage_gb
        value.validate!
      end

      if value = @baseline_ebs_bandwidth_mbps
        value.validate!
      end

      if value = @accelerator_count
        value.validate!
      end

      if value = @accelerator_total_memory_mi_b
        value.validate!
      end

      if value = @network_bandwidth_gbps
        value.validate!
      end

      if value = @allowed_instance_types
        raise Core::ValidationError.new("AllowedInstanceTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AllowedInstanceTypes must have at most 400 item(s)") if value.size > 400
      end

      if value = @baseline_performance_factors
        value.validate!
      end
    end

    def_equals_and_hash(@v_cpu_count, @memory_mi_b, @cpu_manufacturers, @memory_gi_b_per_v_cpu, @excluded_instance_types, @instance_generations, @spot_max_price_percentage_over_lowest_price, @on_demand_max_price_percentage_over_lowest_price, @bare_metal, @burstable_performance, @require_hibernate_support, @network_interface_count, @local_storage, @local_storage_types, @total_local_storage_gb, @baseline_ebs_bandwidth_mbps, @accelerator_types, @accelerator_count, @accelerator_manufacturers, @accelerator_names, @accelerator_total_memory_mi_b, @network_bandwidth_gbps, @allowed_instance_types, @max_spot_price_as_percentage_of_optimal_on_demand_price, @baseline_performance_factors, @require_encryption_in_transit)
  end
end
