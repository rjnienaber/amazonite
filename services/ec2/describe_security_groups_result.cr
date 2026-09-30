private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSecurityGroupsResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # Information about the security groups.
    property security_groups : Array(SecurityGroup) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @security_groups : Array(SecurityGroup) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@security_groups || [] of SecurityGroup).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecurityGroupInfo.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        security_groups: node.xpath_nodes("*[local-name()='securityGroupInfo']/*[local-name()='item']").map { |n| SecurityGroup.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @security_groups
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @security_groups)
  end
end
