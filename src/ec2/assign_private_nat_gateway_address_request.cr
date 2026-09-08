private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssignPrivateNatGatewayAddressRequest
    # The ID of the NAT gateway.
    property nat_gateway_id : String

    # The private IPv4 addresses you want to assign to the private NAT gateway.
    property private_ip_addresses : Array(String) | Nil

    # The number of private IP addresses to assign to the NAT gateway. You can't specify this
    # parameter when also specifying private IP addresses.
    property private_ip_address_count : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @nat_gateway_id : String,
      @private_ip_addresses : Array(String) | Nil = nil,
      @private_ip_address_count : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}NatGatewayId", @nat_gateway_id}

      (@private_ip_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PrivateIpAddress.#{i}", item}
      end

      if value = @private_ip_address_count
        params << {"#{prefix}PrivateIpAddressCount", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        nat_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NatGatewayId']")).not_nil!,
        private_ip_addresses: node.xpath_nodes("*[local-name()='PrivateIpAddress']/*[local-name()='item']").map { |n| n.content },
        private_ip_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='PrivateIpAddressCount']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @private_ip_address_count
        raise Core::ValidationError.new("PrivateIpAddressCount value must be >= 1") if value < 1
        raise Core::ValidationError.new("PrivateIpAddressCount value must be <= 31") if value > 31
      end
    end

    def_equals_and_hash(@nat_gateway_id, @private_ip_addresses, @private_ip_address_count, @dry_run)
  end
end
