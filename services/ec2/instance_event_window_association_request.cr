private alias Core = Amazonite::Core

module Amazonite::EC2
  # One or more targets associated with the specified event window. Only one *type* of target
  # (instance ID, instance tag, or Dedicated Host ID) can be associated with an event window.
  class InstanceEventWindowAssociationRequest
    # The IDs of the instances to associate with the event window. If the instance is on a Dedicated
    # Host, you can't specify the Instance ID parameter; you must use the Dedicated Host ID parameter.
    property instance_ids : Array(String) | Nil

    # The instance tags to associate with the event window. Any instances associated with the tags
    # will be associated with the event window.
    #
    # Note that while you can't create tag keys beginning with `aws:`, you can specify existing Amazon
    # Web Services managed tag keys (with the `aws:` prefix) when specifying them as targets to
    # associate with the event window.
    property instance_tags : Array(Tag) | Nil

    # The IDs of the Dedicated Hosts to associate with the event window.
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
