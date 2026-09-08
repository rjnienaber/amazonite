private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The CPU options for the instance. Both the core count and threads per core must be specified in
  # the request.
  class CpuOptionsRequest
    # The number of CPU cores for the instance.
    property core_count : Int32 | Nil

    # The number of threads per CPU core. To disable multithreading for the instance, specify a value
    # of `1`. Otherwise, specify the default value of `2`.
    property threads_per_core : Int32 | Nil

    # Indicates whether to enable the instance for AMD SEV-SNP. AMD SEV-SNP is supported with M6a,
    # R6a, and C6a instance types only. For more information, see [AMD
    # SEV-SNP](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/sev-snp.html).
    property amd_sev_snp : AmdSevSnpSpecification | Nil

    # Indicates whether to enable the instance for nested virtualization. Nested virtualization is
    # supported only on 8th generation Intel-based instance types (c8i, m8i, r8i, and their flex
    # variants). When nested virtualization is enabled, Virtual Secure Mode (VSM) is automatically
    # disabled for the instance.
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
        core_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='CoreCount']")),
        threads_per_core: Core::XMLValue.i32(node.xpath_node("*[local-name()='ThreadsPerCore']")),
        amd_sev_snp: (n = node.xpath_node("*[local-name()='AmdSevSnp']")) ? AEC::AmdSevSnpSpecification.from_json_object_key?(n.content) : nil,
        nested_virtualization: (n = node.xpath_node("*[local-name()='NestedVirtualization']")) ? AEC::NestedVirtualizationSpecification.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@core_count, @threads_per_core, @amd_sev_snp, @nested_virtualization)
  end
end
