private alias Core = Amazonite::Core

module Amazonite::EC2
  # The Spot placement score for this Region or Availability Zone. The score is calculated based on
  # the assumption that the `capacity-optimized` allocation strategy is used and that all of the
  # Availability Zones in the Region can be used.
  class SpotPlacementScore
    # The Region.
    property region : String | Nil

    # The Availability Zone.
    property availability_zone_id : String | Nil

    # The placement score, on a scale from `1` to `10`. A score of `10` indicates that your Spot
    # request is highly likely to succeed in this Region or Availability Zone. A score of `1`
    # indicates that your Spot request is not likely to succeed.
    property score : Int32 | Nil

    def initialize(
      @region : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @score : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @region
        params << {"#{prefix}Region", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @score
        params << {"#{prefix}Score", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='region']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        score: Core::XMLValue.i32(node.xpath_node("*[local-name()='score']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@region, @availability_zone_id, @score)
  end
end
