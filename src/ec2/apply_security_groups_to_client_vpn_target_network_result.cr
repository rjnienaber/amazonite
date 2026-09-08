module Amazonite::EC2
  class ApplySecurityGroupsToClientVpnTargetNetworkResult
    # The IDs of the applied security groups.
    property security_group_ids : Array(String) | Nil

    def initialize(
      @security_group_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@security_group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupIds.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        security_group_ids: node.xpath_nodes("*[local-name()='securityGroupIds']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@security_group_ids)
  end
end
