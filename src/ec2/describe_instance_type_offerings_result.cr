private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInstanceTypeOfferingsResult
    # The instance types offered in the location.
    property instance_type_offerings : Array(InstanceTypeOffering) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @instance_type_offerings : Array(InstanceTypeOffering) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instance_type_offerings || [] of InstanceTypeOffering).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceTypeOfferingSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_type_offerings: node.xpath_nodes("*[local-name()='instanceTypeOfferingSet']/*[local-name()='item']").map { |n| InstanceTypeOffering.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @instance_type_offerings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_type_offerings, @next_token)
  end
end
