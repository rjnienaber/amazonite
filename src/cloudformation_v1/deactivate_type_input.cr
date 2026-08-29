private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DeactivateTypeInput
    # The type name of the extension in this account and Region. If you specified a type name alias
    # when enabling the extension, use the type name alias.
    #
    # Conditional: You must specify either `Arn`, or `TypeName` and `Type`.
    property type_name : String | Nil

    # The extension type.
    #
    # Conditional: You must specify either `Arn`, or `TypeName` and `Type`.
    property type : ThirdPartyType | Nil

    # The Amazon Resource Name (ARN) for the extension in this account and Region.
    #
    # Conditional: You must specify either `Arn`, or `TypeName` and `Type`.
    property arn : String | Nil

    def initialize(
      @type_name : String | Nil = nil,
      @type : ThirdPartyType | Nil = nil,
      @arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type_name
        params << {"#{prefix}TypeName", value}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::ThirdPartyType.from_json_object_key?(n.content) : nil,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
      )
    end
  end
end
