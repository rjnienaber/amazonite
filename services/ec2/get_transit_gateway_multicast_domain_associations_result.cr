private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetTransitGatewayMulticastDomainAssociationsResult
    # Information about the multicast domain associations.
    property multicast_domain_associations : Array(TransitGatewayMulticastDomainAssociation) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @multicast_domain_associations : Array(TransitGatewayMulticastDomainAssociation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@multicast_domain_associations || [] of TransitGatewayMulticastDomainAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MulticastDomainAssociations.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        multicast_domain_associations: node.xpath_nodes("*[local-name()='multicastDomainAssociations']/*[local-name()='item']").map { |n| TransitGatewayMulticastDomainAssociation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @multicast_domain_associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@multicast_domain_associations, @next_token)
  end
end
