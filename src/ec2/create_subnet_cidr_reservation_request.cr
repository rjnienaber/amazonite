private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateSubnetCidrReservationRequest
    # The ID of the subnet.
    property subnet_id : String

    # The IPv4 or IPV6 CIDR range to reserve.
    property cidr : String

    # The type of reservation. The reservation type determines how the reserved IP addresses are
    # assigned to resources.
    #
    # - `prefix` - Amazon Web Services assigns the reserved IP addresses to network interfaces.
    #
    # - `explicit` - You assign the reserved IP addresses to network interfaces.
    property reservation_type : SubnetCidrReservationType

    # The description to assign to the subnet CIDR reservation.
    property description : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The tags to assign to the subnet CIDR reservation.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @subnet_id : String,
      @cidr : String,
      @reservation_type : SubnetCidrReservationType,
      @description : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SubnetId", @subnet_id}

      params << {"#{prefix}Cidr", @cidr}

      params << {"#{prefix}ReservationType", @reservation_type.to_json_object_key}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetId']")).not_nil!,
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")).not_nil!,
        reservation_type: ((n = node.xpath_node("*[local-name()='ReservationType']")) ? AEC::SubnetCidrReservationType.from_json_object_key?(n.content) : nil).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@subnet_id, @cidr, @reservation_type, @description, @dry_run, @tag_specifications)
  end
end
