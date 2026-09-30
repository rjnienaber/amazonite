private alias Core = Amazonite::Core

module Amazonite::EC2
  # The baseline performance to consider, using an instance family as a baseline reference. The
  # instance family establishes the lowest acceptable level of performance. Amazon EC2 uses this
  # baseline to guide instance type selection, but there is no guarantee that the selected instance
  # types will always exceed the baseline for every application.
  #
  # Currently, this parameter only supports CPU performance as a baseline performance factor. For
  # example, specifying `c6i` would use the CPU performance of the `c6i` family as the baseline
  # reference.
  class BaselinePerformanceFactorsRequest
    # The CPU performance to consider, using an instance family as the baseline reference.
    property cpu : CpuPerformanceFactorRequest | Nil

    def initialize(
      @cpu : CpuPerformanceFactorRequest | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cpu
        params.concat(value.to_query_params("#{prefix}Cpu."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cpu: node.xpath_node("*[local-name()='Cpu']").try { |n| CpuPerformanceFactorRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @cpu
        value.validate!
      end
    end

    def_equals_and_hash(@cpu)
  end
end
