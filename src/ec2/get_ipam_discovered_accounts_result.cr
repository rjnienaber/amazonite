private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamDiscoveredAccountsResult
    # Discovered accounts.
    property ipam_discovered_accounts : Array(IpamDiscoveredAccount) | Nil

    # Specify the pagination token from a previous request to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @ipam_discovered_accounts : Array(IpamDiscoveredAccount) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipam_discovered_accounts || [] of IpamDiscoveredAccount).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamDiscoveredAccountSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_discovered_accounts: node.xpath_nodes("*[local-name()='ipamDiscoveredAccountSet']/*[local-name()='item']").map { |n| IpamDiscoveredAccount.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @ipam_discovered_accounts
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_discovered_accounts, @next_token)
  end
end
