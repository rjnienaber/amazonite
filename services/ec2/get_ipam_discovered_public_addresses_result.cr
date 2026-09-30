private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamDiscoveredPublicAddressesResult
    # IPAM discovered public addresses.
    property ipam_discovered_public_addresses : Array(IpamDiscoveredPublicAddress) | Nil

    # The oldest successful resource discovery time.
    property oldest_sample_time : Time | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @ipam_discovered_public_addresses : Array(IpamDiscoveredPublicAddress) | Nil = nil,
      @oldest_sample_time : Time | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipam_discovered_public_addresses || [] of IpamDiscoveredPublicAddress).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamDiscoveredPublicAddressSet.#{i}."))
      end

      if value = @oldest_sample_time
        params << {"#{prefix}OldestSampleTime", Core::QueryValue.time(value)}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_discovered_public_addresses: node.xpath_nodes("*[local-name()='ipamDiscoveredPublicAddressSet']/*[local-name()='item']").map { |n| IpamDiscoveredPublicAddress.from_xml(n) },
        oldest_sample_time: Core::XMLValue.time(node.xpath_node("*[local-name()='oldestSampleTime']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @ipam_discovered_public_addresses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_discovered_public_addresses, @oldest_sample_time, @next_token)
  end
end
