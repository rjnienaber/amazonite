private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a launch request for one or more instances, and includes owner, requester, and
  # security group information that applies to all instances in the launch request.
  class Reservation
    # The ID of the reservation.
    property reservation_id : String | Nil

    # The ID of the Amazon Web Services account that owns the reservation.
    property owner_id : String | Nil

    # The ID of the requester that launched the instances on your behalf (for example, Amazon Web
    # Services Management Console or Auto Scaling).
    property requester_id : String | Nil

    # Not supported.
    property groups : Array(GroupIdentifier) | Nil

    # The instances.
    property instances : Array(Instance) | Nil

    def initialize(
      @reservation_id : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @requester_id : String | Nil = nil,
      @groups : Array(GroupIdentifier) | Nil = nil,
      @instances : Array(Instance) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @reservation_id
        params << {"#{prefix}ReservationId", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @requester_id
        params << {"#{prefix}RequesterId", value}
      end

      (@groups || [] of GroupIdentifier).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GroupSet.#{i}."))
      end

      (@instances || [] of Instance).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstancesSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservationId']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        requester_id: Core::XMLValue.string(node.xpath_node("*[local-name()='requesterId']")),
        groups: node.xpath_nodes("*[local-name()='groupSet']/*[local-name()='item']").map { |n| GroupIdentifier.from_xml(n) },
        instances: node.xpath_nodes("*[local-name()='instancesSet']/*[local-name()='item']").map { |n| Instance.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @groups
        value.each(&.validate!)
      end

      if value = @instances
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@reservation_id, @owner_id, @requester_id, @groups, @instances)
  end
end
