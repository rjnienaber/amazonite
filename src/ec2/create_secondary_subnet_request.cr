private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateSecondarySubnetRequest
    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensure
    # Idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # The Availability Zone for the secondary subnet. You cannot specify both `AvailabilityZone` and
    # `AvailabilityZoneId` in the same request.
    property availability_zone : String | Nil

    # The ID of the Availability Zone for the secondary subnet. This option is preferred over
    # `AvailabilityZone` as it provides a consistent identifier across Amazon Web Services accounts.
    # You cannot specify both `AvailabilityZone` and `AvailabilityZoneId` in the same request.
    property availability_zone_id : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IPv4 CIDR block for the secondary subnet. The CIDR block size must be between /12 and /28.
    property ipv_4_cidr_block : String

    # The ID of the secondary network in which to create the secondary subnet.
    property secondary_network_id : String

    # The tags to assign to the secondary subnet.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @ipv_4_cidr_block : String,
      @secondary_network_id : String,
      @client_token : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}Ipv4CidrBlock", @ipv_4_cidr_block}

      params << {"#{prefix}SecondaryNetworkId", @secondary_network_id}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipv_4_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv4CidrBlock']")).not_nil!,
        secondary_network_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SecondaryNetworkId']")).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@client_token, @availability_zone, @availability_zone_id, @dry_run, @ipv_4_cidr_block, @secondary_network_id, @tag_specifications)
  end
end
