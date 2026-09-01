private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class PublishTypeInput
    # The type of the extension.
    #
    # Conditional: You must specify `Arn`, or `TypeName` and `Type`.
    property type : ThirdPartyType | Nil

    # The Amazon Resource Name (ARN) of the extension.
    #
    # Conditional: You must specify `Arn`, or `TypeName` and `Type`.
    property arn : String | Nil

    # The name of the extension.
    #
    # Conditional: You must specify `Arn`, or `TypeName` and `Type`.
    property type_name : String | Nil

    # The version number to assign to this version of the extension.
    #
    # Use the following format, and adhere to semantic versioning when assigning a version number to
    # your extension:
    #
    # `MAJOR.MINOR.PATCH`
    #
    # For more information, see [Semantic Versioning 2.0.0](https://semver.org/).
    #
    # If you don't specify a version number, CloudFormation increments the version number by one minor
    # version release.
    #
    # You cannot specify a version number the first time you publish a type. CloudFormation
    # automatically sets the first version number to be `1.0.0`.
    property public_version_number : String | Nil

    def initialize(
      @type : ThirdPartyType | Nil = nil,
      @arn : String | Nil = nil,
      @type_name : String | Nil = nil,
      @public_version_number : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @type_name
        params << {"#{prefix}TypeName", value}
      end

      if value = @public_version_number
        params << {"#{prefix}PublicVersionNumber", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::ThirdPartyType.from_json_object_key?(n.content) : nil,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        public_version_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicVersionNumber']")),
      )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Arn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Arn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:[0-9]{12}:type/.+$"))
      end

      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("TypeName length must be <= 204") if value.size > 204
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}$"))
      end

      if value = @public_version_number
        raise Core::ValidationError.new("PublicVersionNumber length must be >= 5") if value.size < 5
        raise Core::ValidationError.new("PublicVersionNumber does not match the required pattern") unless value.matches?(Regex.new("^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(.*)$"))
      end
    end

    def_equals_and_hash(@type, @arn, @type_name, @public_version_number)
  end
end
