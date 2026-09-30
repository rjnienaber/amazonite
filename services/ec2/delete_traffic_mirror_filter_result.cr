private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteTrafficMirrorFilterResult
    # The ID of the Traffic Mirror filter.
    property traffic_mirror_filter_id : String | Nil

    def initialize(
      @traffic_mirror_filter_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @traffic_mirror_filter_id
        params << {"#{prefix}TrafficMirrorFilterId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_filter_id: Core::XMLValue.string(node.xpath_node("*[local-name()='trafficMirrorFilterId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@traffic_mirror_filter_id)
  end
end
