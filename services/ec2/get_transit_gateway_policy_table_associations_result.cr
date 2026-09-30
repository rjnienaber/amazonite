private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetTransitGatewayPolicyTableAssociationsResult
    # Returns details about the transit gateway policy table association.
    property associations : Array(TransitGatewayPolicyTableAssociation) | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    def initialize(
      @associations : Array(TransitGatewayPolicyTableAssociation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@associations || [] of TransitGatewayPolicyTableAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Associations.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        associations: node.xpath_nodes("*[local-name()='associations']/*[local-name()='item']").map { |n| TransitGatewayPolicyTableAssociation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@associations, @next_token)
  end
end
