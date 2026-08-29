private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class TestTypeInput
    property arn : String | Nil

    property type : ThirdPartyType | Nil

    property type_name : String | Nil

    property version_id : String | Nil

    property log_delivery_bucket : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @type : ThirdPartyType | Nil = nil,
      @type_name : String | Nil = nil,
      @version_id : String | Nil = nil,
      @log_delivery_bucket : String | Nil = nil,
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

      if value = @version_id
        params << {"#{prefix}VersionId", value}
      end

      if value = @log_delivery_bucket
        params << {"#{prefix}LogDeliveryBucket", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::ThirdPartyType.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionId']")),
        log_delivery_bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='LogDeliveryBucket']")),
      )
    end
  end
end
