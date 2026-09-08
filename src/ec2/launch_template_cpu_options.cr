private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The CPU options for the instance.
  class LaunchTemplateCpuOptions
    # The number of CPU cores for the instance.
    property core_count : Int32 | Nil

    # The number of threads per CPU core.
    property threads_per_core : Int32 | Nil

    # Indicates whether the instance is enabled for AMD SEV-SNP. For more information, see [AMD
    # SEV-SNP for Amazon EC2
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/sev-snp.html).
    property amd_sev_snp : AmdSevSnpSpecification | Nil

    # Indicates whether the instance is enabled for nested virtualization.
    property nested_virtualization : NestedVirtualizationSpecification | Nil

    def initialize(
      @core_count : Int32 | Nil = nil,
      @threads_per_core : Int32 | Nil = nil,
      @amd_sev_snp : AmdSevSnpSpecification | Nil = nil,
      @nested_virtualization : NestedVirtualizationSpecification | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @core_count
        params << {"#{prefix}CoreCount", value.to_s}
      end

      if value = @threads_per_core
        params << {"#{prefix}ThreadsPerCore", value.to_s}
      end

      if value = @amd_sev_snp
        params << {"#{prefix}AmdSevSnp", value.to_json_object_key}
      end

      if value = @nested_virtualization
        params << {"#{prefix}NestedVirtualization", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        core_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='coreCount']")),
        threads_per_core: Core::XMLValue.i32(node.xpath_node("*[local-name()='threadsPerCore']")),
        amd_sev_snp: (n = node.xpath_node("*[local-name()='amdSevSnp']")) ? AEC::AmdSevSnpSpecification.from_json_object_key?(n.content) : nil,
        nested_virtualization: (n = node.xpath_node("*[local-name()='nestedVirtualization']")) ? AEC::NestedVirtualizationSpecification.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@core_count, @threads_per_core, @amd_sev_snp, @nested_virtualization)
  end
end
