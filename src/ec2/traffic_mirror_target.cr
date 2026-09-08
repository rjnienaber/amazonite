private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Traffic Mirror target.
  class TrafficMirrorTarget
    # The ID of the Traffic Mirror target.
    property traffic_mirror_target_id : String | Nil

    # The network interface ID that is attached to the target.
    property network_interface_id : String | Nil

    # The Amazon Resource Name (ARN) of the Network Load Balancer.
    property network_load_balancer_arn : String | Nil

    # The type of Traffic Mirror target.
    property type : TrafficMirrorTargetType | Nil

    # Information about the Traffic Mirror target.
    property description : String | Nil

    # The ID of the account that owns the Traffic Mirror target.
    property owner_id : String | Nil

    # The tags assigned to the Traffic Mirror target.
    property tags : Array(Tag) | Nil

    # The ID of the Gateway Load Balancer endpoint.
    property gateway_load_balancer_endpoint_id : String | Nil

    def initialize(
      @traffic_mirror_target_id : String | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @network_load_balancer_arn : String | Nil = nil,
      @type : TrafficMirrorTargetType | Nil = nil,
      @description : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @gateway_load_balancer_endpoint_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @traffic_mirror_target_id
        params << {"#{prefix}TrafficMirrorTargetId", value}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @network_load_balancer_arn
        params << {"#{prefix}NetworkLoadBalancerArn", value}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @gateway_load_balancer_endpoint_id
        params << {"#{prefix}GatewayLoadBalancerEndpointId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='trafficMirrorTargetId']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        network_load_balancer_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='networkLoadBalancerArn']")),
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::TrafficMirrorTargetType.from_json_object_key?(n.content) : nil,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        gateway_load_balancer_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='gatewayLoadBalancerEndpointId']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@traffic_mirror_target_id, @network_interface_id, @network_load_balancer_arn, @type, @description, @owner_id, @tags, @gateway_load_balancer_endpoint_id)
  end
end
