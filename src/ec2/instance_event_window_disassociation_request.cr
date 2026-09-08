private alias Core = Amazonite::Core

module Amazonite::EC2
  # The targets to disassociate from the specified event window.
  class InstanceEventWindowDisassociationRequest
    # The IDs of the instances to disassociate from the event window.
    property instance_ids : Array(String) | Nil

    # The instance tags to disassociate from the event window. Any instances associated with the tags
    # will be disassociated from the event window.
    property instance_tags : Array(Tag) | Nil

    # The IDs of the Dedicated Hosts to disassociate from the event window.
    property dedicated_host_ids : Array(String) | Nil

    def initialize(
      @instance_ids : Array(String) | Nil = nil,
      @instance_tags : Array(Tag) | Nil = nil,
      @dedicated_host_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instance_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceId.#{i}", item}
      end

      (@instance_tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceTag.#{i}."))
      end

      (@dedicated_host_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DedicatedHostId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_ids: node.xpath_nodes("*[local-name()='InstanceId']/*[local-name()='item']").map { |n| n.content },
        instance_tags: node.xpath_nodes("*[local-name()='InstanceTag']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        dedicated_host_ids: node.xpath_nodes("*[local-name()='DedicatedHostId']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @instance_tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_ids, @instance_tags, @dedicated_host_ids)
  end
end
