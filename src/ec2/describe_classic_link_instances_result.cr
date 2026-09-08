private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeClassicLinkInstancesResult
    # Information about one or more linked EC2-Classic instances.
    property instances : Array(ClassicLinkInstance) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @instances : Array(ClassicLinkInstance) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instances || [] of ClassicLinkInstance).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstancesSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instances: node.xpath_nodes("*[local-name()='instancesSet']/*[local-name()='item']").map { |n| ClassicLinkInstance.from_xml(n) },
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
