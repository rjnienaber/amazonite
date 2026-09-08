private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateRouteServerEndpointRequest
    # The ID of the route server for which to create an endpoint.
    property route_server_id : String

    # The ID of the subnet in which to create the route server endpoint.
    property subnet_id : String

    # Unique, case-sensitive identifier to ensure idempotency of the request.
    property client_token : String | Nil

    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The tags to apply to the route server endpoint during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @route_server_id : String,
      @subnet_id : String,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RouteServerId", @route_server_id}

      params << {"#{prefix}SubnetId", @subnet_id}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RouteServerId']")).not_nil!,
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetId']")).not_nil!,
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@route_server_id, @subnet_id, @client_token, @dry_run, @tag_specifications)
  end
end
