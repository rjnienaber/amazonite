private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The supportability score for a single instance type and Availability Zone combination.
  class CapacityManagerSupportabilityScore
    # The instance type.
    property instance_type : String | Nil

    # The ID of the Availability Zone.
    property availability_zone_id : String | Nil

    # How well the combination can support the requested capacity right now. `high` means that the
    # combination holds several times the requested amount. `medium` means that it can cover the
    # request with little to spare. `low` means that it holds less than the requested amount.
    property score : SupportabilityScore | Nil

    def initialize(
      @instance_type : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @score : SupportabilityScore | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @score
        params << {"#{prefix}Score", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        score: (n = node.xpath_node("*[local-name()='score']")) ? AEC::SupportabilityScore.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_type, @availability_zone_id, @score)
  end
end
