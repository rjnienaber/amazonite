private alias Core = Amazonite::Core

module Amazonite::EC2
  class StopInstancesResult
    # Information about the stopped instances.
    property stopping_instances : Array(InstanceStateChange) | Nil

    def initialize(
      @stopping_instances : Array(InstanceStateChange) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@stopping_instances || [] of InstanceStateChange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstancesSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stopping_instances: node.xpath_nodes("*[local-name()='instancesSet']/*[local-name()='item']").map { |n| InstanceStateChange.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @stopping_instances
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@stopping_instances)
  end
end
