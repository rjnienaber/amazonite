private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEndpointServicePermissionsResult
    # Information about the allowed principals.
    property allowed_principals : Array(AllowedPrincipal) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @allowed_principals : Array(AllowedPrincipal) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@allowed_principals || [] of AllowedPrincipal).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AllowedPrincipals.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allowed_principals: node.xpath_nodes("*[local-name()='allowedPrincipals']/*[local-name()='item']").map { |n| AllowedPrincipal.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @allowed_principals
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@allowed_principals, @next_token)
  end
end
