private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteTrafficMirrorSessionResult
    # The ID of the deleted Traffic Mirror session.
    property traffic_mirror_session_id : String | Nil

    def initialize(
      @traffic_mirror_session_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @traffic_mirror_session_id
        params << {"#{prefix}TrafficMirrorSessionId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_session_id: Core::XMLValue.string(node.xpath_node("*[local-name()='trafficMirrorSessionId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@traffic_mirror_session_id)
  end
end
