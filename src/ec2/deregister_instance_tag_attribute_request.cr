private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the tag keys to deregister for the current Region. You can either specify
  # individual tag keys or deregister all tag keys in the current Region. You must specify either
  # `IncludeAllTagsOfInstance` or `InstanceTagKeys` in the request
  class DeregisterInstanceTagAttributeRequest
    # Indicates whether to deregister all tag keys in the current Region. Specify `false` to
    # deregister all tag keys.
    property include_all_tags_of_instance : Bool | Nil

    # Information about the tag keys to deregister.
    property instance_tag_keys : Array(String) | Nil

    def initialize(
      @include_all_tags_of_instance : Bool | Nil = nil,
      @instance_tag_keys : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @include_all_tags_of_instance
        params << {"#{prefix}IncludeAllTagsOfInstance", Core::QueryValue.bool(value)}
      end

      (@instance_tag_keys || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceTagKey.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        include_all_tags_of_instance: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeAllTagsOfInstance']")),
        instance_tag_keys: node.xpath_nodes("*[local-name()='InstanceTagKey']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@include_all_tags_of_instance, @instance_tag_keys)
  end
end
