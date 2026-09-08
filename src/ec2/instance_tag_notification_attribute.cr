private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the registered tag keys for the current Region.
  class InstanceTagNotificationAttribute
    # The registered tag keys.
    property instance_tag_keys : Array(String) | Nil

    # Indicates wheter all tag keys in the current Region are registered to appear in scheduled event
    # notifications. `true` indicates that all tag keys in the current Region are registered.
    property include_all_tags_of_instance : Bool | Nil

    def initialize(
      @instance_tag_keys : Array(String) | Nil = nil,
      @include_all_tags_of_instance : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instance_tag_keys || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceTagKeySet.#{i}", item}
      end

      if value = @include_all_tags_of_instance
        params << {"#{prefix}IncludeAllTagsOfInstance", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_tag_keys: node.xpath_nodes("*[local-name()='instanceTagKeySet']/*[local-name()='item']").map { |n| n.content },
        include_all_tags_of_instance: Core::XMLValue.bool(node.xpath_node("*[local-name()='includeAllTagsOfInstance']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_tag_keys, @include_all_tags_of_instance)
  end
end
