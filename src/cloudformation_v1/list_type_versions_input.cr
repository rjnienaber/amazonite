private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListTypeVersionsInput
    property type : RegistryType | Nil

    property type_name : String | Nil

    property arn : String | Nil

    property max_results : Int32 | Nil

    property next_token : String | Nil

    property deprecated_status : DeprecatedStatus | Nil

    property publisher_id : String | Nil

    def initialize(
      @type : RegistryType | Nil = nil,
      @type_name : String | Nil = nil,
      @arn : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @deprecated_status : DeprecatedStatus | Nil = nil,
      @publisher_id : String | Nil = nil,
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

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @deprecated_status
        params << {"#{prefix}DeprecatedStatus", value.to_json_object_key}
      end

      if value = @publisher_id
        params << {"#{prefix}PublisherId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::RegistryType.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        deprecated_status: (n = node.xpath_node("*[local-name()='DeprecatedStatus']")) ? ACF::DeprecatedStatus.from_json_object_key?(n.content) : nil,
        publisher_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherId']")),
      )
    end
  end
end
