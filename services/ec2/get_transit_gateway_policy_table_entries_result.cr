private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetTransitGatewayPolicyTableEntriesResult
    # The entries for the transit gateway policy table.
    property transit_gateway_policy_table_entries : Array(TransitGatewayPolicyTableEntry) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @transit_gateway_policy_table_entries : Array(TransitGatewayPolicyTableEntry) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@transit_gateway_policy_table_entries || [] of TransitGatewayPolicyTableEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TransitGatewayPolicyTableEntries.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_policy_table_entries: node.xpath_nodes("*[local-name()='transitGatewayPolicyTableEntries']/*[local-name()='item']").map { |n| TransitGatewayPolicyTableEntry.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @transit_gateway_policy_table_entries
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_policy_table_entries, @next_token)
  end
end
