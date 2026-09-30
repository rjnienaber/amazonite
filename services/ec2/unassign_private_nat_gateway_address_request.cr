private alias Core = Amazonite::Core

module Amazonite::EC2
  class UnassignPrivateNatGatewayAddressRequest
    # The ID of the NAT gateway.
    property nat_gateway_id : String

    # The private IPv4 addresses you want to unassign.
    property private_ip_addresses : Array(String) = [] of String

    # The maximum amount of time to wait (in seconds) before forcibly releasing the IP addresses if
    # connections are still in progress. Default value is 350 seconds.
    property max_drain_duration_seconds : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @nat_gateway_id : String,
      @private_ip_addresses : Array(String),
      @max_drain_duration_seconds : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}NatGatewayId", @nat_gateway_id}

      @private_ip_addresses.each_with_index(1) do |item, i|
        params << {"#{prefix}PrivateIpAddress.#{i}", item}
      end

      if value = @max_drain_duration_seconds
        params << {"#{prefix}MaxDrainDurationSeconds", value.to_s}
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
        max_drain_duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxDrainDurationSeconds']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @max_drain_duration_seconds
        raise Core::ValidationError.new("MaxDrainDurationSeconds value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxDrainDurationSeconds value must be <= 4000") if value > 4000
      end
    end

    def_equals_and_hash(@nat_gateway_id, @private_ip_addresses, @max_drain_duration_seconds, @dry_run)
  end
end
