private alias Core = Amazonite::Core

module Amazonite::EC2
  class StartInstancesResult
    # Information about the started instances.
    property starting_instances : Array(InstanceStateChange) | Nil

    def initialize(
      @starting_instances : Array(InstanceStateChange) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@starting_instances || [] of InstanceStateChange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstancesSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        starting_instances: node.xpath_nodes("*[local-name()='instancesSet']/*[local-name()='item']").map { |n| InstanceStateChange.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @starting_instances
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@starting_instances)
  end
end
