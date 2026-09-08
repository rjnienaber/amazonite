private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyTrafficMirrorFilterRuleResult
    # Tags are not returned for ModifyTrafficMirrorFilterRule.
    #
    # A Traffic Mirror rule.
    property traffic_mirror_filter_rule : TrafficMirrorFilterRule | Nil

    def initialize(
      @traffic_mirror_filter_rule : TrafficMirrorFilterRule | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @traffic_mirror_filter_rule
        params.concat(value.to_query_params("#{prefix}TrafficMirrorFilterRule."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_filter_rule: node.xpath_node("*[local-name()='trafficMirrorFilterRule']").try { |n| TrafficMirrorFilterRule.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @traffic_mirror_filter_rule
        value.validate!
      end
    end

    def_equals_and_hash(@traffic_mirror_filter_rule)
  end
end
