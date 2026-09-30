private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyTrafficMirrorFilterNetworkServicesRequest
    # The ID of the Traffic Mirror filter.
    property traffic_mirror_filter_id : String

    # The network service, for example Amazon DNS, that you want to mirror.
    property add_network_services : Array(TrafficMirrorNetworkService) | Nil

    # The network service, for example Amazon DNS, that you no longer want to mirror.
    property remove_network_services : Array(TrafficMirrorNetworkService) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @traffic_mirror_filter_id : String,
      @add_network_services : Array(TrafficMirrorNetworkService) | Nil = nil,
      @remove_network_services : Array(TrafficMirrorNetworkService) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TrafficMirrorFilterId", @traffic_mirror_filter_id}

      (@add_network_services || [] of TrafficMirrorNetworkService).each_with_index(1) do |item, i|
        params << {"#{prefix}AddNetworkService.#{i}", item.to_json_object_key}
      end

      (@remove_network_services || [] of TrafficMirrorNetworkService).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveNetworkService.#{i}", item.to_json_object_key}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_filter_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TrafficMirrorFilterId']")).not_nil!,
        add_network_services: node.xpath_nodes("*[local-name()='AddNetworkService']/*[local-name()='item']").compact_map { |n| AEC::TrafficMirrorNetworkService.from_json_object_key?(n.content) },
        remove_network_services: node.xpath_nodes("*[local-name()='RemoveNetworkService']/*[local-name()='item']").compact_map { |n| AEC::TrafficMirrorNetworkService.from_json_object_key?(n.content) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@traffic_mirror_filter_id, @add_network_services, @remove_network_services, @dry_run)
  end
end
