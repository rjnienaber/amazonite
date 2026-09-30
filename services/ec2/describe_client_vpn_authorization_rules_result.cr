private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeClientVpnAuthorizationRulesResult
    # Information about the authorization rules.
    property authorization_rules : Array(AuthorizationRule) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @authorization_rules : Array(AuthorizationRule) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@authorization_rules || [] of AuthorizationRule).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AuthorizationRule.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        authorization_rules: node.xpath_nodes("*[local-name()='authorizationRule']/*[local-name()='item']").map { |n| AuthorizationRule.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @authorization_rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@authorization_rules, @next_token)
  end
end
