private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class TypeFilters
    property category : Category | Nil

    property publisher_id : String | Nil

    property type_name_prefix : String | Nil

    def initialize(
      @category : Category | Nil = nil,
      @publisher_id : String | Nil = nil,
      @type_name_prefix : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @category
        params << {"#{prefix}Category", value.to_json_object_key}
      end

      if value = @publisher_id
        params << {"#{prefix}PublisherId", value}
      end

      if value = @type_name_prefix
        params << {"#{prefix}TypeNamePrefix", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        category: (n = node.xpath_node("*[local-name()='Category']")) ? ACF::Category.from_json_object_key?(n.content) : nil,
        publisher_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherId']")),
        type_name_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeNamePrefix']")),
      )
    end
  end
end
