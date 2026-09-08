private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeClientVpnConnectionsResult
    # Information about the active and terminated client connections.
    property connections : Array(ClientVpnConnection) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @connections : Array(ClientVpnConnection) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@connections || [] of ClientVpnConnection).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Connections.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        connections: node.xpath_nodes("*[local-name()='connections']/*[local-name()='item']").map { |n| ClientVpnConnection.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @connections
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@connections, @next_token)
  end
end
