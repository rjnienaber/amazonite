private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeStaleSecurityGroupsResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # Information about the stale security groups.
    property stale_security_group_set : Array(StaleSecurityGroup) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @stale_security_group_set : Array(StaleSecurityGroup) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@stale_security_group_set || [] of StaleSecurityGroup).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StaleSecurityGroupSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        stale_security_group_set: node.xpath_nodes("*[local-name()='staleSecurityGroupSet']/*[local-name()='item']").map { |n| StaleSecurityGroup.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @stale_security_group_set
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @stale_security_group_set)
  end
end
