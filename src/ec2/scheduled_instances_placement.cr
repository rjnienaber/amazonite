private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the placement for a Scheduled Instance.
  class ScheduledInstancesPlacement
    # The Availability Zone.
    property availability_zone : String | Nil

    # The name of the placement group.
    property group_name : String | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @group_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@availability_zone, @group_name)
  end
end
