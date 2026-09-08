private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a route server endpoint and its properties.
  #
  # A route server endpoint is an Amazon Web Services-managed component inside a subnet that
  # facilitates [BGP (Border Gateway
  # Protocol)](https://en.wikipedia.org/wiki/Border_Gateway_Protocol) connections between your route
  # server and your BGP peers.
  class RouteServerEndpoint
    # The ID of the route server associated with this endpoint.
    property route_server_id : String | Nil

    # The unique identifier of the route server endpoint.
    property route_server_endpoint_id : String | Nil

    # The ID of the VPC containing the endpoint.
    property vpc_id : String | Nil

    # The ID of the subnet to place the route server endpoint into.
    property subnet_id : String | Nil

    # The ID of the Elastic network interface for the endpoint.
    property eni_id : String | Nil

    # The IP address of the Elastic network interface for the endpoint.
    property eni_address : String | Nil

    # The current state of the route server endpoint.
    property state : RouteServerEndpointState | Nil

    # The reason for any failure in endpoint creation or operation.
    property failure_reason : String | Nil

    # Any tags assigned to the route server endpoint.
    property tags : Array(Tag) | Nil

    def initialize(
      @route_server_id : String | Nil = nil,
      @route_server_endpoint_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @eni_id : String | Nil = nil,
      @eni_address : String | Nil = nil,
      @state : RouteServerEndpointState | Nil = nil,
      @failure_reason : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route_server_id
        params << {"#{prefix}RouteServerId", value}
      end

      if value = @route_server_endpoint_id
        params << {"#{prefix}RouteServerEndpointId", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @eni_id
        params << {"#{prefix}EniId", value}
      end

      if value = @eni_address
        params << {"#{prefix}EniAddress", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @failure_reason
        params << {"#{prefix}FailureReason", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeServerId']")),
        route_server_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeServerEndpointId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        eni_id: Core::XMLValue.string(node.xpath_node("*[local-name()='eniId']")),
        eni_address: Core::XMLValue.string(node.xpath_node("*[local-name()='eniAddress']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::RouteServerEndpointState.from_json_object_key?(n.content) : nil,
        failure_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='failureReason']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@route_server_id, @route_server_endpoint_id, @vpc_id, @subnet_id, @eni_id, @eni_address, @state, @failure_reason, @tags)
  end
end
