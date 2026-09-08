private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a resource group to which a Capacity Reservation has been added.
  class CapacityReservationGroup
    # The ARN of the resource group.
    property group_arn : String | Nil

    # The ID of the Amazon Web Services account that owns the resource group.
    property owner_id : String | Nil

    def initialize(
      @group_arn : String | Nil = nil,
      @owner_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_arn
        params << {"#{prefix}GroupArn", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='groupArn']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@group_arn, @owner_id)
  end
end
