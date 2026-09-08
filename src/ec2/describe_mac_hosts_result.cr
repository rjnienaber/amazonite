private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeMacHostsResult
    # Information about the EC2 Mac Dedicated Hosts.
    property mac_hosts : Array(MacHost) | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @mac_hosts : Array(MacHost) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@mac_hosts || [] of MacHost).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MacHostSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        mac_hosts: node.xpath_nodes("*[local-name()='macHostSet']/*[local-name()='item']").map { |n| MacHost.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @mac_hosts
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@mac_hosts, @next_token)
  end
end
