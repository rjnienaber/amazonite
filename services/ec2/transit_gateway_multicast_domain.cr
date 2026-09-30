private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the transit gateway multicast domain.
  class TransitGatewayMulticastDomain
    # The ID of the transit gateway multicast domain.
    property transit_gateway_multicast_domain_id : String | Nil

    # The ID of the transit gateway.
    property transit_gateway_id : String | Nil

    # The Amazon Resource Name (ARN) of the transit gateway multicast domain.
    property transit_gateway_multicast_domain_arn : String | Nil

    # The ID of the Amazon Web Services account that owns the transit gateway multicast domain.
    property owner_id : String | Nil

    # The options for the transit gateway multicast domain.
    property options : TransitGatewayMulticastDomainOptions | Nil

    # The state of the transit gateway multicast domain.
    property state : TransitGatewayMulticastDomainState | Nil

    # The time the transit gateway multicast domain was created.
    property creation_time : Time | Nil

    # The tags for the transit gateway multicast domain.
    property tags : Array(Tag) | Nil

    def initialize(
      @transit_gateway_multicast_domain_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @transit_gateway_multicast_domain_arn : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @options : TransitGatewayMulticastDomainOptions | Nil = nil,
      @state : TransitGatewayMulticastDomainState | Nil = nil,
      @creation_time : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_multicast_domain_id
        params << {"#{prefix}TransitGatewayMulticastDomainId", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @transit_gateway_multicast_domain_arn
        params << {"#{prefix}TransitGatewayMulticastDomainArn", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @options
        params.concat(value.to_query_params("#{prefix}Options."))
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_multicast_domain_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayMulticastDomainId']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        transit_gateway_multicast_domain_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayMulticastDomainArn']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        options: node.xpath_node("*[local-name()='options']").try { |n| TransitGatewayMulticastDomainOptions.from_xml(n) },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayMulticastDomainState.from_json_object_key?(n.content) : nil,
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @options
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_multicast_domain_id, @transit_gateway_id, @transit_gateway_multicast_domain_arn, @owner_id, @options, @state, @creation_time, @tags)
  end
end
