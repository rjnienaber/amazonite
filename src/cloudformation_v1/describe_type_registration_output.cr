private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeTypeRegistrationOutput
    property progress_status : RegistrationStatus | Nil

    property description : String | Nil

    property type_arn : String | Nil

    property type_version_arn : String | Nil

    def initialize(
      @progress_status : RegistrationStatus | Nil = nil,
      @description : String | Nil = nil,
      @type_arn : String | Nil = nil,
      @type_version_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @progress_status
        params << {"#{prefix}ProgressStatus", value.to_json_object_key}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @type_arn
        params << {"#{prefix}TypeArn", value}
      end

      if value = @type_version_arn
        params << {"#{prefix}TypeVersionArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        progress_status: (n = node.xpath_node("*[local-name()='ProgressStatus']")) ? ACF::RegistrationStatus.from_json_object_key?(n.content) : nil,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeArn']")),
        type_version_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeVersionArn']")),
      )
    end
  end
end
