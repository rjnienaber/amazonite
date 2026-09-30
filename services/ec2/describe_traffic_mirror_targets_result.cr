private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeTrafficMirrorTargetsResult
    # Information about one or more Traffic Mirror targets.
    property traffic_mirror_targets : Array(TrafficMirrorTarget) | Nil

    # The token to use to retrieve the next page of results. The value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @traffic_mirror_targets : Array(TrafficMirrorTarget) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@traffic_mirror_targets || [] of TrafficMirrorTarget).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TrafficMirrorTargetSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_targets: node.xpath_nodes("*[local-name()='trafficMirrorTargetSet']/*[local-name()='item']").map { |n| TrafficMirrorTarget.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @traffic_mirror_targets
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@traffic_mirror_targets, @next_token)
  end
end
