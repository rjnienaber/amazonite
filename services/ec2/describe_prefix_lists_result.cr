private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribePrefixListsResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # All available prefix lists.
    property prefix_lists : Array(PrefixList) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @prefix_lists : Array(PrefixList) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@prefix_lists || [] of PrefixList).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrefixListSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        prefix_lists: node.xpath_nodes("*[local-name()='prefixListSet']/*[local-name()='item']").map { |n| PrefixList.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @prefix_lists
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @prefix_lists)
  end
end
