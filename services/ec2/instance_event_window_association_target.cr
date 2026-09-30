private alias Core = Amazonite::Core

module Amazonite::EC2
  # One or more targets associated with the event window.
  class InstanceEventWindowAssociationTarget
    # The IDs of the instances associated with the event window.
    property instance_ids : Array(String) | Nil

    # The instance tags associated with the event window. Any instances associated with the tags will
    # be associated with the event window.
    #
    # Note that while you can't create tag keys beginning with `aws:`, you can specify existing Amazon
    # Web Services managed tag keys (with the `aws:` prefix) when specifying them as targets to
    # associate with the event window.
    property tags : Array(Tag) | Nil

    # The IDs of the Dedicated Hosts associated with the event window.
    property dedicated_host_ids : Array(String) | Nil

    def initialize(
      @instance_ids : Array(String) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @dedicated_host_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instance_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceIdSet.#{i}", item}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      (@dedicated_host_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DedicatedHostIdSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_ids: node.xpath_nodes("*[local-name()='instanceIdSet']/*[local-name()='item']").map { |n| n.content },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        dedicated_host_ids: node.xpath_nodes("*[local-name()='dedicatedHostIdSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_ids, @tags, @dedicated_host_ids)
  end
end
