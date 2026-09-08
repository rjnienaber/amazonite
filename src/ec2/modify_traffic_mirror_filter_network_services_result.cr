private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyTrafficMirrorFilterNetworkServicesResult
    # The Traffic Mirror filter that the network service is associated with.
    property traffic_mirror_filter : TrafficMirrorFilter | Nil

    def initialize(
      @traffic_mirror_filter : TrafficMirrorFilter | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @traffic_mirror_filter
        params.concat(value.to_query_params("#{prefix}TrafficMirrorFilter."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_filter: node.xpath_node("*[local-name()='trafficMirrorFilter']").try { |n| TrafficMirrorFilter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @traffic_mirror_filter
        value.validate!
      end
    end

    def_equals_and_hash(@traffic_mirror_filter)
  end
end
