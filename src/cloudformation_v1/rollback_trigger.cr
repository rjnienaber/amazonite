private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # A rollback trigger CloudFormation monitors during creation and updating of stacks. If any of the
  # alarms you specify goes to ALARM state during the stack operation or within the specified
  # monitoring period afterwards, CloudFormation rolls back the entire stack operation.
  class RollbackTrigger
    # The Amazon Resource Name (ARN) of the rollback trigger.
    #
    # If a specified trigger is missing, the entire stack operation fails and is rolled back.
    property arn : String

    # The resource type of the rollback trigger. Specify either
    # [AWS::CloudWatch::Alarm](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-cloudwatch-alarm.html)
    # or
    # [AWS::CloudWatch::CompositeAlarm](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-cloudwatch-compositealarm.html)
    # resource types.
    property type : String

    def initialize(
      @arn : String,
      @type : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Arn", @arn}

      params << {"#{prefix}Type", @type}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        type: Core::XMLValue.string(node.xpath_node("*[local-name()='Type']")).not_nil!,
      )
    end

    def_equals_and_hash(@arn, @type)
  end
end
