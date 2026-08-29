private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ActivateTypeInput
    property type : ThirdPartyType | Nil

    property public_type_arn : String | Nil

    property publisher_id : String | Nil

    property type_name : String | Nil

    property type_name_alias : String | Nil

    property auto_update : Bool | Nil

    property logging_config : LoggingConfig | Nil

    property execution_role_arn : String | Nil

    property version_bump : VersionBump | Nil

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
