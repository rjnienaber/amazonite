private alias Core = Amazonite::Core

module Amazonite::EC2
  # The CPU performance to consider, using an instance family as the baseline reference.
  class CpuPerformanceFactor
    # Specify an instance family to use as the baseline reference for CPU performance. All instance
    # types that match your specified attributes will be compared against the CPU performance of the
    # referenced instance family, regardless of CPU manufacturer or architecture differences.
    #
    # Currently, only one instance family can be specified in the list.
    property references : Array(PerformanceFactorReference) | Nil

    def initialize(
      @references : Array(PerformanceFactorReference) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@references || [] of PerformanceFactorReference).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ReferenceSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        references: node.xpath_nodes("*[local-name()='referenceSet']/*[local-name()='item']").map { |n| PerformanceFactorReference.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @references
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@references)
  end
end
