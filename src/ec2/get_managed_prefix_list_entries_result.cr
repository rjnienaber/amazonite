private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetManagedPrefixListEntriesResult
    # Information about the prefix list entries.
    property entries : Array(PrefixListEntry) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @entries : Array(PrefixListEntry) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@entries || [] of PrefixListEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}EntrySet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        entries: node.xpath_nodes("*[local-name()='entrySet']/*[local-name()='item']").map { |n| PrefixListEntry.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @entries
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@entries, @next_token)
  end
end
