private alias Core = Amazonite::Core

module Amazonite::EC2
  # The CPU performance to consider, using an instance family as the baseline reference.
  class CpuPerformanceFactorRequest
    # Specify an instance family to use as the baseline reference for CPU performance. All instance
    # types that match your specified attributes will be compared against the CPU performance of the
    # referenced instance family, regardless of CPU manufacturer or architecture differences.
    #
    # Currently, only one instance family can be specified in the list.
    property references : Array(PerformanceFactorReferenceRequest) | Nil

    def initialize(
      @references : Array(PerformanceFactorReferenceRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@references || [] of PerformanceFactorReferenceRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Reference.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        references: node.xpath_nodes("*[local-name()='Reference']/*[local-name()='item']").map { |n| PerformanceFactorReferenceRequest.from_xml(n) },
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
