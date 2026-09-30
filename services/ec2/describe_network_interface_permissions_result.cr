private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output for DescribeNetworkInterfacePermissions.
  class DescribeNetworkInterfacePermissionsResult
    # The network interface permissions.
    property network_interface_permissions : Array(NetworkInterfacePermission) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @network_interface_permissions : Array(NetworkInterfacePermission) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@network_interface_permissions || [] of NetworkInterfacePermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NetworkInterfacePermissions.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_interface_permissions: node.xpath_nodes("*[local-name()='networkInterfacePermissions']/*[local-name()='item']").map { |n| NetworkInterfacePermission.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @network_interface_permissions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_interface_permissions, @next_token)
  end
end
