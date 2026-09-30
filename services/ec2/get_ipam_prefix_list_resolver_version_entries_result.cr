private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamPrefixListResolverVersionEntriesResult
    # The CIDR entries for the specified resolver version.
    property entries : Array(IpamPrefixListResolverVersionEntry) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @entries : Array(IpamPrefixListResolverVersionEntry) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@entries || [] of IpamPrefixListResolverVersionEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}EntrySet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        entries: node.xpath_nodes("*[local-name()='entrySet']/*[local-name()='item']").map { |n| IpamPrefixListResolverVersionEntry.from_xml(n) },
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
