private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ModuleInfo
    property type_hierarchy : String | Nil

    property logical_id_hierarchy : String | Nil

    def initialize(
      @type_hierarchy : String | Nil = nil,
      @logical_id_hierarchy : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type_hierarchy
        params << {"#{prefix}TypeHierarchy", value}
      end

      if value = @logical_id_hierarchy
        params << {"#{prefix}LogicalIdHierarchy", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type_hierarchy: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeHierarchy']")),
        logical_id_hierarchy: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalIdHierarchy']")),
      )
    end
  end
end
