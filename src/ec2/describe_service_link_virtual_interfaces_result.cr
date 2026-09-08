private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeServiceLinkVirtualInterfacesResult
    # Describes the service link virtual interfaces.
    property service_link_virtual_interfaces : Array(ServiceLinkVirtualInterface) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @service_link_virtual_interfaces : Array(ServiceLinkVirtualInterface) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@service_link_virtual_interfaces || [] of ServiceLinkVirtualInterface).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ServiceLinkVirtualInterfaceSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_link_virtual_interfaces: node.xpath_nodes("*[local-name()='serviceLinkVirtualInterfaceSet']/*[local-name()='item']").map { |n| ServiceLinkVirtualInterface.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @service_link_virtual_interfaces
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@service_link_virtual_interfaces, @next_token)
  end
end
