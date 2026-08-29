private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class TypeVersionSummary
    property type : RegistryType | Nil

    property type_name : String | Nil

    property version_id : String | Nil

    property is_default_version : Bool | Nil

    property arn : String | Nil

    property time_created : Time | Nil

    property description : String | Nil

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
  end
end
