private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateInstanceProfileRequest
    property instance_profile_name : String

    property path : String | Nil

    property tags : Array(Tag) | Nil

    def initialize(
      @instance_profile_name : String,
      @path : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceProfileName", @instance_profile_name}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_profile_name: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceProfileName']")).not_nil!,
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
