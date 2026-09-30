private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcEndpointServicePermissionsResult
    # Information about the added principals.
    property added_principals : Array(AddedPrincipal) | Nil

    # Returns `true` if the request succeeds; otherwise, it returns an error.
    property return_value : Bool | Nil

    def initialize(
      @added_principals : Array(AddedPrincipal) | Nil = nil,
      @return_value : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@added_principals || [] of AddedPrincipal).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AddedPrincipalSet.#{i}."))
      end

      if value = @return_value
        params << {"#{prefix}Return", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        added_principals: node.xpath_nodes("*[local-name()='addedPrincipalSet']/*[local-name()='item']").map { |n| AddedPrincipal.from_xml(n) },
        return_value: Core::XMLValue.bool(node.xpath_node("*[local-name()='return']")),
      )
    end

    def validate! : Nil
      if value = @added_principals
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@added_principals, @return_value)
  end
end
