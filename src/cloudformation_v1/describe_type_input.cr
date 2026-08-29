private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeTypeInput
    property type : RegistryType | Nil

    property type_name : String | Nil

    property arn : String | Nil

    property version_id : String | Nil

    property publisher_id : String | Nil

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
  end
end
