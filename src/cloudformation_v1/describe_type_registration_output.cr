private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeTypeRegistrationOutput
    # The current status of the extension registration request.
    property progress_status : RegistrationStatus | Nil

    # The description of the extension registration request.
    property description : String | Nil

    # The Amazon Resource Name (ARN) of the extension being registered.
    #
    # For registration requests with a `ProgressStatus` of other than `COMPLETE`, this will be `null`.
    property type_arn : String | Nil

    # The Amazon Resource Name (ARN) of this specific version of the extension being registered.
    #
    # For registration requests with a `ProgressStatus` of other than `COMPLETE`, this will be `null`.
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

    def_equals_and_hash(@progress_status, @description, @type_arn, @type_version_arn)
  end
end
