private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeDhcpOptionsResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # Information about the DHCP options sets.
    property dhcp_options : Array(DhcpOptions) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @dhcp_options : Array(DhcpOptions) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@dhcp_options || [] of DhcpOptions).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DhcpOptionsSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        dhcp_options: node.xpath_nodes("*[local-name()='dhcpOptionsSet']/*[local-name()='item']").map { |n| DhcpOptions.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @dhcp_options
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @dhcp_options)
  end
end
