private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class EntityInfo
    property arn : String

    property name : String

    property type : PolicyOwnerEntityType

    property id : String

    property path : String | Nil

    def initialize(
      @arn : String,
      @name : String,
      @type : PolicyOwnerEntityType,
      @id : String,
      @path : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Arn", @arn}

      params << {"#{prefix}Name", @name}

      params << {"#{prefix}Type", @type.to_json_object_key}

      params << {"#{prefix}Id", @id}

      if value = @path
        params << {"#{prefix}Path", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")).not_nil!,
        type: (n = node.xpath_node("*[local-name()='Type']")) ? AI::PolicyOwnerEntityType.from_json_object_key?(n.content) : nil.not_nil!,
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='Id']")).not_nil!,
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
      )
    end
  end
end
