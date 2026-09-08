private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeHostsResult
    # Information about the Dedicated Hosts.
    property hosts : Array(Host) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @hosts : Array(Host) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@hosts || [] of Host).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}HostSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        hosts: node.xpath_nodes("*[local-name()='hostSet']/*[local-name()='item']").map { |n| Host.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @hosts
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@hosts, @next_token)
  end
end
