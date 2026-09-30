private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateSecurityGroupResult
    # The ID of the security group.
    property group_id : String | Nil

    # The tags assigned to the security group.
    property tags : Array(Tag) | Nil

    # The security group ARN.
    property security_group_arn : String | Nil

    def initialize(
      @group_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @security_group_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @security_group_arn
        params << {"#{prefix}SecurityGroupArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        security_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='securityGroupArn']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@group_id, @tags, @security_group_arn)
  end
end
