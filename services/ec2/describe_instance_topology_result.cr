private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInstanceTopologyResult
    # Information about the topology of each instance.
    property instances : Array(InstanceTopology) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @instances : Array(InstanceTopology) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instances || [] of InstanceTopology).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instances: node.xpath_nodes("*[local-name()='instanceSet']/*[local-name()='item']").map { |n| InstanceTopology.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @instances
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instances, @next_token)
  end
end
