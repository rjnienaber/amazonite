private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeTypeOutput
    property arn : String | Nil

    property type : RegistryType | Nil

    property type_name : String | Nil

    property default_version_id : String | Nil

    property is_default_version : Bool | Nil

    property type_tests_status : TypeTestsStatus | Nil

    property type_tests_status_description : String | Nil

    property description : String | Nil

    property schema : String | Nil

    property provisioning_type : ProvisioningType | Nil

    property deprecated_status : DeprecatedStatus | Nil

    property logging_config : LoggingConfig | Nil

    property required_activated_types : Array(RequiredActivatedType) | Nil

    property execution_role_arn : String | Nil

    property visibility : Visibility | Nil

    property source_url : String | Nil

    property documentation_url : String | Nil

    property last_updated : Time | Nil

    property time_created : Time | Nil

    property configuration_schema : String | Nil

    property publisher_id : String | Nil

    property original_type_name : String | Nil

    property original_type_arn : String | Nil

    property public_version_number : String | Nil

    property latest_public_version : String | Nil

    property is_activated : Bool | Nil

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
  end
end
