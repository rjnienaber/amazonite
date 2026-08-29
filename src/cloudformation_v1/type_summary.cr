private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Contains summary information about the specified CloudFormation extension.
  class TypeSummary
    # The kind of extension.
    property type : RegistryType | Nil

    # The name of the extension.
    #
    # If you specified a `TypeNameAlias` when you call the
    # [ActivateType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html)
    # API operation in your account and Region, CloudFormation considers that alias as the type name.
    property type_name : String | Nil

    # The ID of the default version of the extension. The default version is used when the extension
    # version isn't specified.
    #
    # This applies only to private extensions you have registered in your account. For public
    # extensions, both those provided by Amazon and published by third parties, CloudFormation returns
    # `null`. For more information, see
    # [RegisterType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html).
    #
    # To set the default version of an extension, use SetTypeDefaultVersion.
    property default_version_id : String | Nil

    # The ARN of the extension.
    property type_arn : String | Nil

    # When the specified extension version was registered. This applies only to:
    #
    # - Private extensions you have registered in your account. For more information, see
    # [RegisterType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html).
    #
    # - Public extensions you have activated in your account with auto-update specified. For more
    # information, see
    # [ActivateType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html).
    #
    # For all other extension types, CloudFormation returns `null`.
    property last_updated : Time | Nil

    # The description of the extension.
    property description : String | Nil

    # The ID of the extension publisher, if the extension is published by a third party. Extensions
    # published by Amazon don't return a publisher ID.
    property publisher_id : String | Nil

    # For public extensions that have been activated for this account and Region, the type name of the
    # public extension.
    #
    # If you specified a `TypeNameAlias` when enabling the extension in this account and Region,
    # CloudFormation treats that alias as the extension's type name within the account and Region, not
    # the type name of the public extension. For more information, see [Use aliases to refer to
    # extensions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-alias)
    # in the *CloudFormation User Guide*.
    property original_type_name : String | Nil

    # For public extensions that have been activated for this account and Region, the version of the
    # public extension to be used for CloudFormation operations in this account and Region.
    #
    # How you specified `AutoUpdate` when enabling the extension affects whether CloudFormation
    # automatically updates the extension in this account and Region when a new version is released.
    # For more information, see [Automatically use new versions of
    # extensions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-auto)
    # in the *CloudFormation User Guide*.
    property public_version_number : String | Nil

    # For public extensions that have been activated for this account and Region, the latest version
    # of the public extension *that is available*. For any extensions other than activated third-party
    # extensions, CloudFormation returns `null`.
    #
    # How you specified `AutoUpdate` when enabling the extension affects whether CloudFormation
    # automatically updates the extension in this account and Region when a new version is released.
    # For more information, see [Automatically use new versions of
    # extensions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-auto)
    # in the *CloudFormation User Guide*.
    property latest_public_version : String | Nil

    # The service used to verify the publisher identity.
    #
    # For more information, see [Publishing extensions to make them available for public
    # use](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html) in
    # the *CloudFormation Command Line Interface (CLI) User Guide*.
    property publisher_identity : IdentityProvider | Nil

    # The publisher name, as defined in the public profile for that publisher in the service used to
    # verify the publisher identity.
    property publisher_name : String | Nil

    # Whether the extension is activated for this account and Region.
    #
    # This applies only to third-party public extensions. Extensions published by Amazon are activated
    # by default.
    property is_activated : Bool | Nil

    def initialize(
      @type : RegistryType | Nil = nil,
      @type_name : String | Nil = nil,
      @default_version_id : String | Nil = nil,
      @type_arn : String | Nil = nil,
      @last_updated : Time | Nil = nil,
      @description : String | Nil = nil,
      @publisher_id : String | Nil = nil,
      @original_type_name : String | Nil = nil,
      @public_version_number : String | Nil = nil,
      @latest_public_version : String | Nil = nil,
      @publisher_identity : IdentityProvider | Nil = nil,
      @publisher_name : String | Nil = nil,
      @is_activated : Bool | Nil = nil,
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

      if value = @default_version_id
        params << {"#{prefix}DefaultVersionId", value}
      end

      if value = @type_arn
        params << {"#{prefix}TypeArn", value}
      end

      if value = @last_updated
        params << {"#{prefix}LastUpdated", Core::QueryValue.time(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @publisher_id
        params << {"#{prefix}PublisherId", value}
      end

      if value = @original_type_name
        params << {"#{prefix}OriginalTypeName", value}
      end

      if value = @public_version_number
        params << {"#{prefix}PublicVersionNumber", value}
      end

      if value = @latest_public_version
        params << {"#{prefix}LatestPublicVersion", value}
      end

      if value = @publisher_identity
        params << {"#{prefix}PublisherIdentity", value.to_json_object_key}
      end

      if value = @publisher_name
        params << {"#{prefix}PublisherName", value}
      end

      if value = @is_activated
        params << {"#{prefix}IsActivated", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::RegistryType.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        default_version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DefaultVersionId']")),
        type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeArn']")),
        last_updated: Core::XMLValue.time(node.xpath_node("*[local-name()='LastUpdated']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        publisher_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherId']")),
        original_type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='OriginalTypeName']")),
        public_version_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicVersionNumber']")),
        latest_public_version: Core::XMLValue.string(node.xpath_node("*[local-name()='LatestPublicVersion']")),
        publisher_identity: (n = node.xpath_node("*[local-name()='PublisherIdentity']")) ? ACF::IdentityProvider.from_json_object_key?(n.content) : nil,
        publisher_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherName']")),
        is_activated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsActivated']")),
      )
    end
  end
end
