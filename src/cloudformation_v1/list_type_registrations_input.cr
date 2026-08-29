private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListTypeRegistrationsInput
    property type : RegistryType | Nil

    property type_name : String | Nil

    property type_arn : String | Nil

    property registration_status_filter : RegistrationStatus | Nil

    property max_results : Int32 | Nil

    property next_token : String | Nil

    def initialize(
      @type : RegistryType | Nil = nil,
      @type_name : String | Nil = nil,
      @type_arn : String | Nil = nil,
      @registration_status_filter : RegistrationStatus | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
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

      if value = @type_arn
        params << {"#{prefix}TypeArn", value}
      end

      if value = @registration_status_filter
        params << {"#{prefix}RegistrationStatusFilter", value.to_json_object_key}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::RegistryType.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeArn']")),
        registration_status_filter: (n = node.xpath_node("*[local-name()='RegistrationStatusFilter']")) ? ACF::RegistrationStatus.from_json_object_key?(n.content) : nil,
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
