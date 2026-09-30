private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetManagedPrefixListAssociationsResult
    # Information about the associations.
    property prefix_list_associations : Array(PrefixListAssociation) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @prefix_list_associations : Array(PrefixListAssociation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@prefix_list_associations || [] of PrefixListAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrefixListAssociationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefix_list_associations: node.xpath_nodes("*[local-name()='prefixListAssociationSet']/*[local-name()='item']").map { |n| PrefixListAssociation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @prefix_list_associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@prefix_list_associations, @next_token)
  end
end
