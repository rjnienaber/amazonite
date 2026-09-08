private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a subnet CIDR reservation.
  class SubnetCidrReservation
    # The ID of the subnet CIDR reservation.
    property subnet_cidr_reservation_id : String | Nil

    # The ID of the subnet.
    property subnet_id : String | Nil

    # The CIDR that has been reserved.
    property cidr : String | Nil

    # The type of reservation.
    property reservation_type : SubnetCidrReservationType | Nil

    # The ID of the account that owns the subnet CIDR reservation.
    property owner_id : String | Nil

    # The description assigned to the subnet CIDR reservation.
    property description : String | Nil

    # The tags assigned to the subnet CIDR reservation.
    property tags : Array(Tag) | Nil

    def initialize(
      @subnet_cidr_reservation_id : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @cidr : String | Nil = nil,
      @reservation_type : SubnetCidrReservationType | Nil = nil,
      @owner_id : String | Nil = nil,
      @description : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @subnet_cidr_reservation_id
        params << {"#{prefix}SubnetCidrReservationId", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @reservation_type
        params << {"#{prefix}ReservationType", value.to_json_object_key}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subnet_cidr_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetCidrReservationId']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        reservation_type: (n = node.xpath_node("*[local-name()='reservationType']")) ? AEC::SubnetCidrReservationType.from_json_object_key?(n.content) : nil,
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@subnet_cidr_reservation_id, @subnet_id, @cidr, @reservation_type, @owner_id, @description, @tags)
  end
end
