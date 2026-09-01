private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class DescribeTypeOutput
    # The Amazon Resource Name (ARN) of the extension.
    property arn : String | Nil

    # The kind of extension.
    property type : RegistryType | Nil

    # The name of the extension.
    #
    # If the extension is a public third-party type you have activated with a type name alias,
    # CloudFormation returns the type name alias. For more information, see
    # [ActivateType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html).
    property type_name : String | Nil

    # The ID of the default version of the extension. The default version is used when the extension
    # version isn't specified.
    #
    # This applies only to private extensions you have registered in your account. For public
    # extensions, both those provided by Amazon Web Services and published by third parties,
    # CloudFormation returns `null`. For more information, see
    # [RegisterType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html).
    #
    # To set the default version of an extension, use SetTypeDefaultVersion.
    property default_version_id : String | Nil

    # Whether the specified extension version is set as the default version.
    #
    # This applies only to private extensions you have registered in your account, and extensions
    # published by Amazon Web Services. For public third-party extensions, whether they are activated
    # in your account, CloudFormation returns `null`.
    property is_default_version : Bool | Nil

    # The contract test status of the registered extension version. To return the extension test
    # status of a specific extension version, you must specify `VersionId`.
    #
    # This applies only to registered private extension versions. CloudFormation doesn't return this
    # information for public extensions, whether they are activated in your account.
    #
    # - `PASSED`: The extension has passed all its contract tests.
    #
    # An extension must have a test status of `PASSED` before it can be published. For more
    # information, see [Publishing extensions to make them available for public
    # use](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-publish.html)
    # in the *CloudFormation Command Line Interface (CLI) User Guide*.
    #
    # - `FAILED`: The extension has failed one or more contract tests.
    #
    # - `IN_PROGRESS`: Contract tests are currently being performed on the extension.
    #
    # - `NOT_TESTED`: Contract tests haven't been performed on the extension.
    property type_tests_status : TypeTestsStatus | Nil

    # The description of the test status. To return the extension test status of a specific extension
    # version, you must specify `VersionId`.
    #
    # This applies only to registered private extension versions. CloudFormation doesn't return this
    # information for public extensions, whether they are activated in your account.
    property type_tests_status_description : String | Nil

    # The description of the extension.
    property description : String | Nil

    # The schema that defines the extension.
    #
    # For more information, see [Resource type
    # schema](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html)
    # in the *CloudFormation Command Line Interface (CLI) User Guide* and the [CloudFormation Hooks
    # User
    # Guide](https://docs.aws.amazon.com/cloudformation-cli/latest/hooks-userguide/what-is-cloudformation-hooks.html).
    property schema : String | Nil

    # For resource type extensions, the provisioning behavior of the resource type. CloudFormation
    # determines the provisioning type during registration, based on the types of handlers in the
    # schema handler package submitted.
    #
    # Valid values include:
    #
    # - `FULLY_MUTABLE`: The resource type includes an update handler to process updates to the type
    # during stack update operations.
    #
    # - `IMMUTABLE`: The resource type doesn't include an update handler, so the type can't be updated
    # and must instead be replaced during stack update operations.
    #
    # - `NON_PROVISIONABLE`: The resource type doesn't include all the following handlers, and
    # therefore can't actually be provisioned.
    #
    # - create
    #
    # - read
    #
    # - delete
    property provisioning_type : ProvisioningType | Nil

    # The deprecation status of the extension version.
    #
    # Valid values include:
    #
    # - `LIVE`: The extension is activated or registered and can be used in CloudFormation operations,
    # dependent on its provisioning behavior and visibility scope.
    #
    # - `DEPRECATED`: The extension has been deactivated or deregistered and can no longer be used in
    # CloudFormation operations.
    #
    # For public third-party extensions, CloudFormation returns `null`.
    property deprecated_status : DeprecatedStatus | Nil

    # Contains logging configuration information for private extensions. This applies only to private
    # extensions you have registered in your account. For public extensions, both those provided by
    # Amazon Web Services and published by third parties, CloudFormation returns `null`. For more
    # information, see
    # [RegisterType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html).
    property logging_config : LoggingConfig | Nil

    # For extensions that are modules, the public third-party extensions that must be activated in
    # your account in order for the module itself to be activated.
    property required_activated_types : Array(RequiredActivatedType) | Nil

    # The Amazon Resource Name (ARN) of the IAM execution role used to register the extension. This
    # applies only to private extensions you have registered in your account. For more information,
    # see
    # [RegisterType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html).
    #
    # If the registered extension calls any Amazon Web Services APIs, you must create an * [IAM
    # execution role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html) * that includes
    # the necessary permissions to call those Amazon Web Services APIs, and provision that execution
    # role in your account. CloudFormation then assumes that execution role to provide your extension
    # with the appropriate credentials.
    property execution_role_arn : String | Nil

    # The scope at which the extension is visible and usable in CloudFormation operations.
    #
    # Valid values include:
    #
    # - `PRIVATE`: The extension is only visible and usable within the account in which it is
    # registered. CloudFormation marks any extensions you register as `PRIVATE`.
    #
    # - `PUBLIC`: The extension is publicly visible and usable within any Amazon Web Services account.
    property visibility : Visibility | Nil

    # The URL of the source code for the extension.
    property source_url : String | Nil

    # The URL of a page providing detailed documentation for this extension.
    property documentation_url : String | Nil

    # When the specified extension version was registered. This applies only to:
    #
    # - Private extensions you have registered in your account. For more information, see
    # [RegisterType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html).
    #
    # - Public extensions you have activated in your account with auto-update specified. For more
    # information, see
    # [ActivateType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html).
    property last_updated : Time | Nil

    # When the specified private extension version was registered or activated in your account.
    property time_created : Time | Nil

    # A JSON string that represent the current configuration data for the extension in this account
    # and Region.
    #
    # To set the configuration data for an extension, use
    # [SetTypeConfiguration](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_SetTypeConfiguration.html).
    property configuration_schema : String | Nil

    # The publisher ID of the extension publisher.
    #
    # This applies only to public third-party extensions. For private registered extensions, and
    # extensions provided by Amazon Web Services, CloudFormation returns `null`.
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

    # For public extensions that have been activated for this account and Region, the Amazon Resource
    # Name (ARN) of the public extension.
    property original_type_arn : String | Nil

    # The version number of a public third-party extension.
    #
    # This applies only if you specify a public extension you have activated in your account, or
    # specify a public extension without specifying a version. For all other extensions,
    # CloudFormation returns `null`.
    property public_version_number : String | Nil

    # The latest version of a public extension *that is available* for use.
    #
    # This only applies if you specify a public extension, and you don't specify a version. For all
    # other requests, CloudFormation returns `null`.
    property latest_public_version : String | Nil

    # Whether the extension is activated in the account and Region.
    #
    # This only applies to public third-party extensions. For all other extensions, CloudFormation
    # returns `null`.
    property is_activated : Bool | Nil

    # Whether CloudFormation automatically updates the extension in this account and Region when a new
    # *minor* version is published by the extension publisher. Major versions released by the
    # publisher must be manually updated. For more information, see [Automatically use new versions of
    # extensions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-auto)
    # in the *CloudFormation User Guide*.
    property auto_update : Bool | Nil

    def initialize(
      @arn : String | Nil = nil,
      @type : RegistryType | Nil = nil,
      @type_name : String | Nil = nil,
      @default_version_id : String | Nil = nil,
      @is_default_version : Bool | Nil = nil,
      @type_tests_status : TypeTestsStatus | Nil = nil,
      @type_tests_status_description : String | Nil = nil,
      @description : String | Nil = nil,
      @schema : String | Nil = nil,
      @provisioning_type : ProvisioningType | Nil = nil,
      @deprecated_status : DeprecatedStatus | Nil = nil,
      @logging_config : LoggingConfig | Nil = nil,
      @required_activated_types : Array(RequiredActivatedType) | Nil = nil,
      @execution_role_arn : String | Nil = nil,
      @visibility : Visibility | Nil = nil,
      @source_url : String | Nil = nil,
      @documentation_url : String | Nil = nil,
      @last_updated : Time | Nil = nil,
      @time_created : Time | Nil = nil,
      @configuration_schema : String | Nil = nil,
      @publisher_id : String | Nil = nil,
      @original_type_name : String | Nil = nil,
      @original_type_arn : String | Nil = nil,
      @public_version_number : String | Nil = nil,
      @latest_public_version : String | Nil = nil,
      @is_activated : Bool | Nil = nil,
      @auto_update : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @type_name
        params << {"#{prefix}TypeName", value}
      end

      if value = @default_version_id
        params << {"#{prefix}DefaultVersionId", value}
      end

      if value = @is_default_version
        params << {"#{prefix}IsDefaultVersion", Core::QueryValue.bool(value)}
      end

      if value = @type_tests_status
        params << {"#{prefix}TypeTestsStatus", value.to_json_object_key}
      end

      if value = @type_tests_status_description
        params << {"#{prefix}TypeTestsStatusDescription", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @schema
        params << {"#{prefix}Schema", value}
      end

      if value = @provisioning_type
        params << {"#{prefix}ProvisioningType", value.to_json_object_key}
      end

      if value = @deprecated_status
        params << {"#{prefix}DeprecatedStatus", value.to_json_object_key}
      end

      if value = @logging_config
        params.concat(value.to_query_params("#{prefix}LoggingConfig."))
      end

      (@required_activated_types || [] of RequiredActivatedType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RequiredActivatedTypes.member.#{i}."))
      end

      if value = @execution_role_arn
        params << {"#{prefix}ExecutionRoleArn", value}
      end

      if value = @visibility
        params << {"#{prefix}Visibility", value.to_json_object_key}
      end

      if value = @source_url
        params << {"#{prefix}SourceUrl", value}
      end

      if value = @documentation_url
        params << {"#{prefix}DocumentationUrl", value}
      end

      if value = @last_updated
        params << {"#{prefix}LastUpdated", Core::QueryValue.time(value)}
      end

      if value = @time_created
        params << {"#{prefix}TimeCreated", Core::QueryValue.time(value)}
      end

      if value = @configuration_schema
        params << {"#{prefix}ConfigurationSchema", value}
      end

      if value = @publisher_id
        params << {"#{prefix}PublisherId", value}
      end

      if value = @original_type_name
        params << {"#{prefix}OriginalTypeName", value}
      end

      if value = @original_type_arn
        params << {"#{prefix}OriginalTypeArn", value}
      end

      if value = @public_version_number
        params << {"#{prefix}PublicVersionNumber", value}
      end

      if value = @latest_public_version
        params << {"#{prefix}LatestPublicVersion", value}
      end

      if value = @is_activated
        params << {"#{prefix}IsActivated", Core::QueryValue.bool(value)}
      end

      if value = @auto_update
        params << {"#{prefix}AutoUpdate", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::RegistryType.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        default_version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DefaultVersionId']")),
        is_default_version: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsDefaultVersion']")),
        type_tests_status: (n = node.xpath_node("*[local-name()='TypeTestsStatus']")) ? ACF::TypeTestsStatus.from_json_object_key?(n.content) : nil,
        type_tests_status_description: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeTestsStatusDescription']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        schema: Core::XMLValue.string(node.xpath_node("*[local-name()='Schema']")),
        provisioning_type: (n = node.xpath_node("*[local-name()='ProvisioningType']")) ? ACF::ProvisioningType.from_json_object_key?(n.content) : nil,
        deprecated_status: (n = node.xpath_node("*[local-name()='DeprecatedStatus']")) ? ACF::DeprecatedStatus.from_json_object_key?(n.content) : nil,
        logging_config: node.xpath_node("*[local-name()='LoggingConfig']").try { |n| LoggingConfig.from_xml(n) },
        required_activated_types: node.xpath_nodes("*[local-name()='RequiredActivatedTypes']/*[local-name()='member']").map { |n| RequiredActivatedType.from_xml(n) },
        execution_role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ExecutionRoleArn']")),
        visibility: (n = node.xpath_node("*[local-name()='Visibility']")) ? ACF::Visibility.from_json_object_key?(n.content) : nil,
        source_url: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceUrl']")),
        documentation_url: Core::XMLValue.string(node.xpath_node("*[local-name()='DocumentationUrl']")),
        last_updated: Core::XMLValue.time(node.xpath_node("*[local-name()='LastUpdated']")),
        time_created: Core::XMLValue.time(node.xpath_node("*[local-name()='TimeCreated']")),
        configuration_schema: Core::XMLValue.string(node.xpath_node("*[local-name()='ConfigurationSchema']")),
        publisher_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherId']")),
        original_type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='OriginalTypeName']")),
        original_type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OriginalTypeArn']")),
        public_version_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicVersionNumber']")),
        latest_public_version: Core::XMLValue.string(node.xpath_node("*[local-name()='LatestPublicVersion']")),
        is_activated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsActivated']")),
        auto_update: Core::XMLValue.bool(node.xpath_node("*[local-name()='AutoUpdate']")),
      )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Arn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Arn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/.+$"))
      end

      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("TypeName length must be <= 204") if value.size > 204
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}$"))
      end

      if value = @default_version_id
        raise Core::ValidationError.new("DefaultVersionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DefaultVersionId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("DefaultVersionId does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9-]+$"))
      end

      if value = @type_tests_status_description
        raise Core::ValidationError.new("TypeTestsStatusDescription length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TypeTestsStatusDescription length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("TypeTestsStatusDescription does not match the required pattern") unless value.matches?(Regex.new("^[\\s\\S]+$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
      end

      if value = @schema
        raise Core::ValidationError.new("Schema length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Schema length must be <= 16777216") if value.size > 16777216
      end

      if value = @logging_config
        value.validate!
      end

      if value = @required_activated_types
        value.each(&.validate!)
      end

      if value = @execution_role_arn
        raise Core::ValidationError.new("ExecutionRoleArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ExecutionRoleArn length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("ExecutionRoleArn does not match the required pattern") unless value.matches?(Regex.new("^arn:.+:iam::[0-9]{12}:role/.+$"))
      end

      if value = @source_url
        raise Core::ValidationError.new("SourceUrl length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SourceUrl length must be <= 4096") if value.size > 4096
      end

      if value = @documentation_url
        raise Core::ValidationError.new("DocumentationUrl length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("DocumentationUrl length must be <= 4096") if value.size > 4096
      end

      if value = @configuration_schema
        raise Core::ValidationError.new("ConfigurationSchema length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ConfigurationSchema length must be <= 60000") if value.size > 60000
        raise Core::ValidationError.new("ConfigurationSchema does not match the required pattern") unless value.matches?(Regex.new("^[\\s\\S]+$"))
      end

      if value = @publisher_id
        raise Core::ValidationError.new("PublisherId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PublisherId length must be <= 40") if value.size > 40
        raise Core::ValidationError.new("PublisherId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-zA-Z]{12,40}$"))
      end

      if value = @original_type_name
        raise Core::ValidationError.new("OriginalTypeName length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("OriginalTypeName length must be <= 204") if value.size > 204
        raise Core::ValidationError.new("OriginalTypeName does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}$"))
      end

      if value = @original_type_arn
        raise Core::ValidationError.new("OriginalTypeArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("OriginalTypeArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("OriginalTypeArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/.+$"))
      end

      if value = @public_version_number
        raise Core::ValidationError.new("PublicVersionNumber length must be >= 5") if value.size < 5
        raise Core::ValidationError.new("PublicVersionNumber does not match the required pattern") unless value.matches?(Regex.new("^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(.*)$"))
      end

      if value = @latest_public_version
        raise Core::ValidationError.new("LatestPublicVersion length must be >= 5") if value.size < 5
        raise Core::ValidationError.new("LatestPublicVersion does not match the required pattern") unless value.matches?(Regex.new("^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(.*)$"))
      end
    end

    def_equals_and_hash(@arn, @type, @type_name, @default_version_id, @is_default_version, @type_tests_status, @type_tests_status_description, @description, @schema, @provisioning_type, @deprecated_status, @logging_config, @required_activated_types, @execution_role_arn, @visibility, @source_url, @documentation_url, @last_updated, @time_created, @configuration_schema, @publisher_id, @original_type_name, @original_type_arn, @public_version_number, @latest_public_version, @is_activated, @auto_update)
  end
end
