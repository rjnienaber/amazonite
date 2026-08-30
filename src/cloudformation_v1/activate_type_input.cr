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
  end
end
