private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeTrunkInterfaceAssociationsResult
    # Information about the trunk associations.
    property interface_associations : Array(TrunkInterfaceAssociation) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @interface_associations : Array(TrunkInterfaceAssociation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@interface_associations || [] of TrunkInterfaceAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InterfaceAssociationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        interface_associations: node.xpath_nodes("*[local-name()='interfaceAssociationSet']/*[local-name()='item']").map { |n| TrunkInterfaceAssociation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @interface_associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@interface_associations, @next_token)
  end
end
