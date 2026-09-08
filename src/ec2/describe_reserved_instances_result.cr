private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output for DescribeReservedInstances.
  class DescribeReservedInstancesResult
    # A list of Reserved Instances.
    property reserved_instances : Array(ReservedInstances) | Nil

    def initialize(
      @reserved_instances : Array(ReservedInstances) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@reserved_instances || [] of ReservedInstances).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ReservedInstancesSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reserved_instances: node.xpath_nodes("*[local-name()='reservedInstancesSet']/*[local-name()='item']").map { |n| ReservedInstances.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @reserved_instances
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@reserved_instances)
  end
end
