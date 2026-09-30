private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class DescribeTypeInput
    # The kind of extension.
    #
    # Conditional: You must specify either `TypeName` and `Type`, or `Arn`.
    property type : RegistryType | Nil

    # The name of the extension.
    #
    # Conditional: You must specify either `TypeName` and `Type`, or `Arn`.
    property type_name : String | Nil

    # The Amazon Resource Name (ARN) of the extension.
    #
    # Conditional: You must specify either `TypeName` and `Type`, or `Arn`.
    property arn : String | Nil

    # The ID of a specific version of the extension. The version ID is the value at the end of the
    # Amazon Resource Name (ARN) assigned to the extension version when it is registered.
    #
    # If you specify a `VersionId`, `DescribeType` returns information about that specific extension
    # version. Otherwise, it returns information about the default extension version.
    property version_id : String | Nil

    # The publisher ID of the extension publisher.
    #
    # Extensions provided by Amazon Web Services are not assigned a publisher ID.
    property publisher_id : String | Nil

    # The version number of a public third-party extension.
    property public_version_number : String | Nil

    def initialize(
      @type : RegistryType | Nil = nil,
      @type_name : String | Nil = nil,
      @arn : String | Nil = nil,
      @version_id : String | Nil = nil,
      @publisher_id : String | Nil = nil,
      @public_version_number : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @type_name
        params << {"#{prefix}TypeName", value}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @version_id
        params << {"#{prefix}VersionId", value}
      end

      if value = @publisher_id
        params << {"#{prefix}PublisherId", value}
      end

      if value = @public_version_number
        params << {"#{prefix}PublicVersionNumber", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::RegistryType.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionId']")),
        publisher_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherId']")),
        public_version_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicVersionNumber']")),
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
        raise Core::ValidationError.new("Arn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/.+$"))
      end

      if value = @version_id
        raise Core::ValidationError.new("VersionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("VersionId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("VersionId does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9-]+$"))
      end

      if value = @publisher_id
        raise Core::ValidationError.new("PublisherId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PublisherId length must be <= 40") if value.size > 40
        raise Core::ValidationError.new("PublisherId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-zA-Z]{12,40}$"))
      end

      if value = @public_version_number
        raise Core::ValidationError.new("PublicVersionNumber length must be >= 5") if value.size < 5
        raise Core::ValidationError.new("PublicVersionNumber does not match the required pattern") unless value.matches?(Regex.new("^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(.*)$"))
      end
    end

    def_equals_and_hash(@type, @type_name, @arn, @version_id, @publisher_id, @public_version_number)
  end
end
