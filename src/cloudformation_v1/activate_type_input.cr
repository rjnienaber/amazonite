private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ActivateTypeInput
    # The extension type.
    #
    # Conditional: You must specify `PublicTypeArn`, or `TypeName`, `Type`, and `PublisherId`.
    property type : ThirdPartyType | Nil

    # The Amazon Resource Name (ARN) of the public extension.
    #
    # Conditional: You must specify `PublicTypeArn`, or `TypeName`, `Type`, and `PublisherId`.
    property public_type_arn : String | Nil

    # The ID of the extension publisher.
    #
    # Conditional: You must specify `PublicTypeArn`, or `TypeName`, `Type`, and `PublisherId`.
    property publisher_id : String | Nil

    # The name of the extension.
    #
    # Conditional: You must specify `PublicTypeArn`, or `TypeName`, `Type`, and `PublisherId`.
    property type_name : String | Nil

    # An alias to assign to the public extension in this account and Region. If you specify an alias
    # for the extension, CloudFormation treats the alias as the extension type name within this
    # account and Region. You must use the alias to refer to the extension in your templates, API
    # calls, and CloudFormation console.
    #
    # An extension alias must be unique within a given account and Region. You can activate the same
    # public resource multiple times in the same account and Region, using different type name
    # aliases.
    property type_name_alias : String | Nil

    # Whether to automatically update the extension in this account and Region when a new *minor*
    # version is published by the extension publisher. Major versions released by the publisher must
    # be manually updated.
    #
    # The default is `true`.
    property auto_update : Bool | Nil

    # Contains logging configuration information for an extension.
    property logging_config : LoggingConfig | Nil

    # The name of the IAM execution role to use to activate the extension.
    property execution_role_arn : String | Nil

    # Manually updates a previously-activated type to a new major or minor version, if available. You
    # can also use this parameter to update the value of `AutoUpdate`.
    #
    # - `MAJOR`: CloudFormation updates the extension to the newest major version, if one is
    # available.
    #
    # - `MINOR`: CloudFormation updates the extension to the newest minor version, if one is
    # available.
    property version_bump : VersionBump | Nil

    # The major version of this extension you want to activate, if multiple major versions are
    # available. The default is the latest major version. CloudFormation uses the latest available
    # *minor* version of the major version selected.
    #
    # You can specify `MajorVersion` or `VersionBump`, but not both.
    property major_version : Int64 | Nil

    def initialize(
      @type : ThirdPartyType | Nil = nil,
      @public_type_arn : String | Nil = nil,
      @publisher_id : String | Nil = nil,
      @type_name : String | Nil = nil,
      @type_name_alias : String | Nil = nil,
      @auto_update : Bool | Nil = nil,
      @logging_config : LoggingConfig | Nil = nil,
      @execution_role_arn : String | Nil = nil,
      @version_bump : VersionBump | Nil = nil,
      @major_version : Int64 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @public_type_arn
        params << {"#{prefix}PublicTypeArn", value}
      end

      if value = @publisher_id
        params << {"#{prefix}PublisherId", value}
      end

      if value = @type_name
        params << {"#{prefix}TypeName", value}
      end

      if value = @type_name_alias
        params << {"#{prefix}TypeNameAlias", value}
      end

      if value = @auto_update
        params << {"#{prefix}AutoUpdate", Core::QueryValue.bool(value)}
      end

      if value = @logging_config
        params.concat(value.to_query_params("#{prefix}LoggingConfig."))
      end

      if value = @execution_role_arn
        params << {"#{prefix}ExecutionRoleArn", value}
      end

      if value = @version_bump
        params << {"#{prefix}VersionBump", value.to_json_object_key}
      end

      if value = @major_version
        params << {"#{prefix}MajorVersion", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::ThirdPartyType.from_json_object_key?(n.content) : nil,
        public_type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicTypeArn']")),
        publisher_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherId']")),
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        type_name_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeNameAlias']")),
        auto_update: Core::XMLValue.bool(node.xpath_node("*[local-name()='AutoUpdate']")),
        logging_config: node.xpath_node("*[local-name()='LoggingConfig']").try { |n| LoggingConfig.from_xml(n) },
        execution_role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ExecutionRoleArn']")),
        version_bump: (n = node.xpath_node("*[local-name()='VersionBump']")) ? ACF::VersionBump.from_json_object_key?(n.content) : nil,
        major_version: Core::XMLValue.i64(node.xpath_node("*[local-name()='MajorVersion']")),
      )
    end

    def validate! : Nil
      if value = @public_type_arn
        raise Core::ValidationError.new("PublicTypeArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("PublicTypeArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("PublicTypeArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}::type/.+/[0-9a-zA-Z]{12,40}/.+$"))
      end

      if value = @publisher_id
        raise Core::ValidationError.new("PublisherId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PublisherId length must be <= 40") if value.size > 40
        raise Core::ValidationError.new("PublisherId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-zA-Z]{12,40}$"))
      end

      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("TypeName length must be <= 204") if value.size > 204
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}$"))
      end

      if value = @type_name_alias
        raise Core::ValidationError.new("TypeNameAlias length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("TypeNameAlias length must be <= 204") if value.size > 204
        raise Core::ValidationError.new("TypeNameAlias does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}$"))
      end

      if value = @logging_config
        value.validate!
      end

      if value = @execution_role_arn
        raise Core::ValidationError.new("ExecutionRoleArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ExecutionRoleArn length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("ExecutionRoleArn does not match the required pattern") unless value.matches?(Regex.new("^arn:.+:iam::[0-9]{12}:role/.+$"))
      end

      if value = @major_version
        raise Core::ValidationError.new("MajorVersion value must be >= 1") if value < 1
        raise Core::ValidationError.new("MajorVersion value must be <= 100000") if value > 100000
      end
    end

    def_equals_and_hash(@type, @public_type_arn, @publisher_id, @type_name, @type_name_alias, @auto_update, @logging_config, @execution_role_arn, @version_bump, @major_version)
  end
end
