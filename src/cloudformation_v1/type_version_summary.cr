private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Contains summary information about a specific version of a CloudFormation extension.
  class TypeVersionSummary
    # The kind of extension.
    property type : RegistryType | Nil

    # The name of the extension.
    property type_name : String | Nil

    # The ID of a specific version of the extension. The version ID is the value at the end of the ARN
    # assigned to the extension version when it's registered.
    property version_id : String | Nil

    # Whether the specified extension version is set as the default version.
    #
    # This applies only to private extensions you have registered in your account, and extensions
    # published by Amazon. For public third-party extensions, CloudFormation returns `null`.
    property is_default_version : Bool | Nil

    # The ARN of the extension version.
    property arn : String | Nil

    # When the version was registered.
    property time_created : Time | Nil

    # The description of the extension version.
    property description : String | Nil

    # For public extensions that have been activated for this account and Region, the version of the
    # public extension to be used for CloudFormation operations in this account and Region. For any
    # extensions other than activated third-party extensions, CloudFormation returns `null`.
    #
    # How you specified `AutoUpdate` when enabling the extension affects whether CloudFormation
    # automatically updates the extension in this account and Region when a new version is released.
    # For more information, see [Automatically use new versions of
    # extensions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-auto)
    # in the *CloudFormation User Guide*.
    property public_version_number : String | Nil

    def initialize(
      @type : RegistryType | Nil = nil,
      @type_name : String | Nil = nil,
      @version_id : String | Nil = nil,
      @is_default_version : Bool | Nil = nil,
      @arn : String | Nil = nil,
      @time_created : Time | Nil = nil,
      @description : String | Nil = nil,
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

      if value = @version_id
        params << {"#{prefix}VersionId", value}
      end

      if value = @is_default_version
        params << {"#{prefix}IsDefaultVersion", Core::QueryValue.bool(value)}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @time_created
        params << {"#{prefix}TimeCreated", Core::QueryValue.time(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
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
        version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionId']")),
        is_default_version: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsDefaultVersion']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        time_created: Core::XMLValue.time(node.xpath_node("*[local-name()='TimeCreated']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        public_version_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicVersionNumber']")),
      )
    end

    def_equals_and_hash(@type, @type_name, @version_id, @is_default_version, @arn, @time_created, @description, @public_version_number)
  end
end
