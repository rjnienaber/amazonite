private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyTrafficMirrorSessionResult
    # Information about the Traffic Mirror session.
    property traffic_mirror_session : TrafficMirrorSession | Nil

    def initialize(
      @traffic_mirror_session : TrafficMirrorSession | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @traffic_mirror_session
        params.concat(value.to_query_params("#{prefix}TrafficMirrorSession."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_session: node.xpath_node("*[local-name()='trafficMirrorSession']").try { |n| TrafficMirrorSession.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @traffic_mirror_session
        value.validate!
      end
    end

    def_equals_and_hash(@traffic_mirror_session)
  end
end
