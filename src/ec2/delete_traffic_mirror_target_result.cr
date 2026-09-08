private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteTrafficMirrorTargetResult
    # The ID of the deleted Traffic Mirror target.
    property traffic_mirror_target_id : String | Nil

    def initialize(
      @traffic_mirror_target_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @traffic_mirror_target_id
        params << {"#{prefix}TrafficMirrorTargetId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='trafficMirrorTargetId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@traffic_mirror_target_id)
  end
end
