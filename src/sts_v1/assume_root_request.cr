private alias Core = Amazonite::Core

module Amazonite::StsV1
  class AssumeRootRequest
    property target_principal : String

    property task_policy_arn : PolicyDescriptorType

    property duration_seconds : Int32 | Nil

    def initialize(
      @target_principal : String,
      @task_policy_arn : PolicyDescriptorType,
      @duration_seconds : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TargetPrincipal", @target_principal}

      params.concat(@task_policy_arn.to_query_params("#{prefix}TaskPolicyArn."))

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        target_principal: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetPrincipal']")).not_nil!,
        task_policy_arn: node.xpath_node("*[local-name()='TaskPolicyArn']").try { |n| PolicyDescriptorType.from_xml(n) }.not_nil!,
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
      )
    end
  end
end
