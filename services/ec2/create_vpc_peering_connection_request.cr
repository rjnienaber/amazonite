private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVpcPeeringConnectionRequest
    # The Region code for the accepter VPC, if the accepter VPC is located in a Region other than the
    # Region in which you make the request.
    #
    # Default: The Region in which you make the request.
    property peer_region : String | Nil

    # The tags to assign to the peering connection.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the requester VPC. You must specify this parameter in the request.
    property vpc_id : String

    # The ID of the VPC with which you are creating the VPC peering connection. You must specify this
    # parameter in the request.
    property peer_vpc_id : String | Nil

    # The Amazon Web Services account ID of the owner of the accepter VPC.
    #
    # Default: Your Amazon Web Services account ID
    property peer_owner_id : String | Nil

    def initialize(
      @vpc_id : String,
      @peer_region : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @peer_vpc_id : String | Nil = nil,
      @peer_owner_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @peer_region
        params << {"#{prefix}PeerRegion", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}VpcId", @vpc_id}

      if value = @peer_vpc_id
        params << {"#{prefix}PeerVpcId", value}
      end

      if value = @peer_owner_id
        params << {"#{prefix}PeerOwnerId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        peer_region: Core::XMLValue.string(node.xpath_node("*[local-name()='PeerRegion']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")).not_nil!,
        peer_vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='peerVpcId']")),
        peer_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='peerOwnerId']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@peer_region, @tag_specifications, @dry_run, @vpc_id, @peer_vpc_id, @peer_owner_id)
  end
end
