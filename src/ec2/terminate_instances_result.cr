private alias Core = Amazonite::Core

module Amazonite::EC2
  class TerminateInstancesResult
    # Information about the terminated instances.
    property terminating_instances : Array(InstanceStateChange) | Nil

    def initialize(
      @terminating_instances : Array(InstanceStateChange) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@terminating_instances || [] of InstanceStateChange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstancesSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        terminating_instances: node.xpath_nodes("*[local-name()='instancesSet']/*[local-name()='item']").map { |n| InstanceStateChange.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @terminating_instances
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@terminating_instances)
  end
end
