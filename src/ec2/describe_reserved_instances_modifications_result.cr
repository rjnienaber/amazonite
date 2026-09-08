private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of DescribeReservedInstancesModifications.
  class DescribeReservedInstancesModificationsResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # The Reserved Instance modification information.
    property reserved_instances_modifications : Array(ReservedInstancesModification) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @reserved_instances_modifications : Array(ReservedInstancesModification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@reserved_instances_modifications || [] of ReservedInstancesModification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ReservedInstancesModificationsSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        reserved_instances_modifications: node.xpath_nodes("*[local-name()='reservedInstancesModificationsSet']/*[local-name()='item']").map { |n| ReservedInstancesModification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @reserved_instances_modifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @reserved_instances_modifications)
  end
end
