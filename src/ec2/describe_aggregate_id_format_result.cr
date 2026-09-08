private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeAggregateIdFormatResult
    # Indicates whether all resource types in the Region are configured to use longer IDs. This value
    # is only `true` if all users are configured to use longer IDs for all resources types in the
    # Region.
    property use_long_ids_aggregated : Bool | Nil

    # Information about each resource's ID format.
    property statuses : Array(IdFormat) | Nil

    def initialize(
      @use_long_ids_aggregated : Bool | Nil = nil,
      @statuses : Array(IdFormat) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @use_long_ids_aggregated
        params << {"#{prefix}UseLongIdsAggregated", Core::QueryValue.bool(value)}
      end

      (@statuses || [] of IdFormat).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StatusSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        use_long_ids_aggregated: Core::XMLValue.bool(node.xpath_node("*[local-name()='useLongIdsAggregated']")),
        statuses: node.xpath_nodes("*[local-name()='statusSet']/*[local-name()='item']").map { |n| IdFormat.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @statuses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@use_long_ids_aggregated, @statuses)
  end
end
