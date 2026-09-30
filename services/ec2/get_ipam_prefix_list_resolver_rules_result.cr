private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamPrefixListResolverRulesResult
    # The CIDR selection rules for the IPAM prefix list resolver.
    property rules : Array(IpamPrefixListResolverRule) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @rules : Array(IpamPrefixListResolverRule) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@rules || [] of IpamPrefixListResolverRule).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RuleSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        rules: node.xpath_nodes("*[local-name()='ruleSet']/*[local-name()='item']").map { |n| IpamPrefixListResolverRule.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@rules, @next_token)
  end
end
