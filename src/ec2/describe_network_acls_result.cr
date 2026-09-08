private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeNetworkAclsResult
    # Information about the network ACLs.
    property network_acls : Array(NetworkAcl) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @network_acls : Array(NetworkAcl) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@network_acls || [] of NetworkAcl).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NetworkAclSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_acls: node.xpath_nodes("*[local-name()='networkAclSet']/*[local-name()='item']").map { |n| NetworkAcl.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @network_acls
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_acls, @next_token)
  end
end
