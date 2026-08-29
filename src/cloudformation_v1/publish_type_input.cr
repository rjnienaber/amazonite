private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class PublishTypeInput
    property type : ThirdPartyType | Nil

    property arn : String | Nil

    property type_name : String | Nil

    property public_version_number : String | Nil

    def initialize(
      @type : ThirdPartyType | Nil = nil,
      @arn : String | Nil = nil,
      @type_name : String | Nil = nil,
      @public_version_number : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @type_name
        params << {"#{prefix}TypeName", value}
      end

      if value = @public_version_number
        params << {"#{prefix}PublicVersionNumber", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::ThirdPartyType.from_json_object_key?(n.content) : nil,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        public_version_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicVersionNumber']")),
      )
    end
  end
end
