private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateClientVpnTargetNetworkRequest
    # The ID of the Client VPN endpoint.
    property client_vpn_endpoint_id : String

    # The ID of the subnet to associate with the Client VPN endpoint. Required for VPC-based
    # endpoints. For Transit Gateway-based endpoints, use `AvailabilityZone` or `AvailabilityZoneId`
    # instead.
    property subnet_id : String | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The Availability Zone name for the Transit Gateway association. Required if when associating an
    # Availability Zone with a Client VPN endpoint that uses a Transit Gateway. You cannot specify
    # both `SubnetId` and `AvailabilityZone`.
    property availability_zone : String | Nil

    # The Availability Zone ID for the Transit Gateway association. Required if when associating an
    # Availability Zone with a Client VPN endpoint that uses a Transit Gateway. You cannot specify
    # both `AvailabilityZone` and `AvailabilityZoneId`.
    property availability_zone_id : String | Nil

    def initialize(
      @client_vpn_endpoint_id : String,
      @subnet_id : String | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ClientVpnEndpointId", @client_vpn_endpoint_id}

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientVpnEndpointId']")).not_nil!,
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetId']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @subnet_id, @client_token, @dry_run, @availability_zone, @availability_zone_id)
  end
end
