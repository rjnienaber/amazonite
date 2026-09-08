private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSecondaryInterfacesResult
    # Information about the secondary interfaces.
    property secondary_interfaces : Array(SecondaryInterface) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @secondary_interfaces : Array(SecondaryInterface) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@secondary_interfaces || [] of SecondaryInterface).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecondaryInterfaceSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        secondary_interfaces: node.xpath_nodes("*[local-name()='secondaryInterfaceSet']/*[local-name()='item']").map { |n| SecondaryInterface.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @secondary_interfaces
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@secondary_interfaces, @next_token)
  end
end
