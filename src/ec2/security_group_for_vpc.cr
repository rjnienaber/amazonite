private alias Core = Amazonite::Core

module Amazonite::EC2
  # A security group that can be used by interfaces in the VPC.
  class SecurityGroupForVpc
    # The security group's description.
    property description : String | Nil

    # The security group name.
    property group_name : String | Nil

    # The security group owner ID.
    property owner_id : String | Nil

    # The security group ID.
    property group_id : String | Nil

    # The security group tags.
    property tags : Array(Tag) | Nil

    # The VPC ID in which the security group was created.
    property primary_vpc_id : String | Nil

    def initialize(
      @description : String | Nil = nil,
      @group_name : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @group_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @primary_vpc_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @primary_vpc_id
        params << {"#{prefix}PrimaryVpcId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        primary_vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='primaryVpcId']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@description, @group_name, @owner_id, @group_id, @tags, @primary_vpc_id)
  end
end
