private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class RequiredActivatedType
    property type_name_alias : String | Nil

    property original_type_name : String | Nil

    property publisher_id : String | Nil

    property supported_major_versions : Array(Int32) | Nil

    def initialize(
      @type_name_alias : String | Nil = nil,
      @original_type_name : String | Nil = nil,
      @publisher_id : String | Nil = nil,
      @supported_major_versions : Array(Int32) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type_name_alias
        params << {"#{prefix}TypeNameAlias", value}
      end

      if value = @original_type_name
        params << {"#{prefix}OriginalTypeName", value}
      end

      if value = @publisher_id
        params << {"#{prefix}PublisherId", value}
      end

      (@supported_major_versions || [] of Int32).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedMajorVersions.member.#{i}", item.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type_name_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeNameAlias']")),
        original_type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='OriginalTypeName']")),
        publisher_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherId']")),
        supported_major_versions: node.xpath_nodes("*[local-name()='SupportedMajorVersions']/*[local-name()='member']").map { |n| n.content.to_i32 },
      )
    end
  end
end
