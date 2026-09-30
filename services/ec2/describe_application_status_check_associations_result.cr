private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeApplicationStatusCheckAssociationsResult
    # The associations for the specified application status checks.
    property associations : Array(ApplicationStatusCheckAssociationObject) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # The tags associated with the application status checks.
    property tags : Array(Tag) | Nil

    def initialize(
      @associations : Array(ApplicationStatusCheckAssociationObject) | Nil = nil,
      @next_token : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@associations || [] of ApplicationStatusCheckAssociationObject).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AssociationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        associations: node.xpath_nodes("*[local-name()='associationSet']/*[local-name()='item']").map { |n| ApplicationStatusCheckAssociationObject.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @associations
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@associations, @next_token, @tags)
  end
end
