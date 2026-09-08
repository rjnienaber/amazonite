private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTrafficMirrorTargetRequest
    # The network interface ID that is associated with the target.
    property network_interface_id : String | Nil

    # The Amazon Resource Name (ARN) of the Network Load Balancer that is associated with the target.
    property network_load_balancer_arn : String | Nil

    # The description of the Traffic Mirror target.
    property description : String | Nil

    # The tags to assign to the Traffic Mirror target.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [How to ensure
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # The ID of the Gateway Load Balancer endpoint.
    property gateway_load_balancer_endpoint_id : String | Nil

    def initialize(
      @network_interface_id : String | Nil = nil,
      @network_load_balancer_arn : String | Nil = nil,
      @description : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
      @gateway_load_balancer_endpoint_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @network_load_balancer_arn
        params << {"#{prefix}NetworkLoadBalancerArn", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @gateway_load_balancer_endpoint_id
        params << {"#{prefix}GatewayLoadBalancerEndpointId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkInterfaceId']")),
        network_load_balancer_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkLoadBalancerArn']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        gateway_load_balancer_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GatewayLoadBalancerEndpointId']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_interface_id, @network_load_balancer_arn, @description, @tag_specifications, @dry_run, @client_token, @gateway_load_balancer_endpoint_id)
  end
end
