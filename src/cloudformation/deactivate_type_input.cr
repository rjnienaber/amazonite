private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
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

    def validate! : Nil
      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("TypeName length must be <= 204") if value.size > 204
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Arn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Arn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:[0-9]{12}:type/.+$"))
      end
    end

    def_equals_and_hash(@type_name, @type, @arn)
  end
end
