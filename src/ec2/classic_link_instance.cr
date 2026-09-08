private alias Core = Amazonite::Core

module Amazonite::EC2
  # Deprecated.
  #
  # Describes a linked EC2-Classic instance.
  class ClassicLinkInstance
    # The security groups.
    property groups : Array(GroupIdentifier) | Nil

    # The ID of the instance.
    property instance_id : String | Nil

    # Any tags assigned to the instance.
    property tags : Array(Tag) | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    def initialize(
      @groups : Array(GroupIdentifier) | Nil = nil,
      @instance_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @vpc_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@groups || [] of GroupIdentifier).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GroupSet.#{i}."))
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        groups: node.xpath_nodes("*[local-name()='groupSet']/*[local-name()='item']").map { |n| GroupIdentifier.from_xml(n) },
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
      )
    end

    def validate! : Nil
      if value = @groups
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@groups, @instance_id, @tags, @vpc_id)
  end
end
