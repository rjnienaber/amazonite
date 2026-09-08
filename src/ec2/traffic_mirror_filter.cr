private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the Traffic Mirror filter.
  class TrafficMirrorFilter
    # The ID of the Traffic Mirror filter.
    property traffic_mirror_filter_id : String | Nil

    # Information about the ingress rules that are associated with the Traffic Mirror filter.
    property ingress_filter_rules : Array(TrafficMirrorFilterRule) | Nil

    # Information about the egress rules that are associated with the Traffic Mirror filter.
    property egress_filter_rules : Array(TrafficMirrorFilterRule) | Nil

    # The network service traffic that is associated with the Traffic Mirror filter.
    property network_services : Array(TrafficMirrorNetworkService) | Nil

    # The description of the Traffic Mirror filter.
    property description : String | Nil

    # The tags assigned to the Traffic Mirror filter.
    property tags : Array(Tag) | Nil

    def initialize(
      @traffic_mirror_filter_id : String | Nil = nil,
      @ingress_filter_rules : Array(TrafficMirrorFilterRule) | Nil = nil,
      @egress_filter_rules : Array(TrafficMirrorFilterRule) | Nil = nil,
      @network_services : Array(TrafficMirrorNetworkService) | Nil = nil,
      @description : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @traffic_mirror_filter_id
        params << {"#{prefix}TrafficMirrorFilterId", value}
      end

      (@ingress_filter_rules || [] of TrafficMirrorFilterRule).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IngressFilterRuleSet.#{i}."))
      end

      (@egress_filter_rules || [] of TrafficMirrorFilterRule).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}EgressFilterRuleSet.#{i}."))
      end

      (@network_services || [] of TrafficMirrorNetworkService).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkServiceSet.#{i}", item.to_json_object_key}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_filter_id: Core::XMLValue.string(node.xpath_node("*[local-name()='trafficMirrorFilterId']")),
        ingress_filter_rules: node.xpath_nodes("*[local-name()='ingressFilterRuleSet']/*[local-name()='item']").map { |n| TrafficMirrorFilterRule.from_xml(n) },
        egress_filter_rules: node.xpath_nodes("*[local-name()='egressFilterRuleSet']/*[local-name()='item']").map { |n| TrafficMirrorFilterRule.from_xml(n) },
        network_services: node.xpath_nodes("*[local-name()='networkServiceSet']/*[local-name()='item']").compact_map { |n| AEC::TrafficMirrorNetworkService.from_json_object_key?(n.content) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ingress_filter_rules
        value.each(&.validate!)
      end

      if value = @egress_filter_rules
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@traffic_mirror_filter_id, @ingress_filter_rules, @egress_filter_rules, @network_services, @description, @tags)
  end
end
