private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Contains the CPU configuration options for a Dedicated Host allocation request. Options include
  # AMD Secure Encrypted Virtualization-Secure Nested Paging (AMD SEV-SNP) settings.
  class HostCpuOptionsRequest
    # Specifies whether AMD Secure Encrypted Virtualization-Secure Nested Paging (AMD SEV-SNP) is
    # enabled or disabled for the Dedicated Host. If you don't specify a value, AMD SEV-SNP is
    # `disabled`.
    property amd_sev_snp : AmdSevSnp | Nil

    def initialize(
      @amd_sev_snp : AmdSevSnp | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @amd_sev_snp
        params << {"#{prefix}AmdSevSnp", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        amd_sev_snp: (n = node.xpath_node("*[local-name()='AmdSevSnp']")) ? AEC::AmdSevSnp.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@amd_sev_snp)
  end
end
