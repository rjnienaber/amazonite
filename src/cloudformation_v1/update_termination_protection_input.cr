private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class UpdateTerminationProtectionInput
    # Whether to enable termination protection on the specified stack.
    property enable_termination_protection : Bool

    # The name or unique ID of the stack for which you want to set termination protection.
    property stack_name : String

    def initialize(
      @enable_termination_protection : Bool,
      @stack_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}EnableTerminationProtection", Core::QueryValue.bool(@enable_termination_protection)}

      params << {"#{prefix}StackName", @stack_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enable_termination_protection: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnableTerminationProtection']")).not_nil!,
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @stack_name
        raise Core::ValidationError.new("StackName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StackName does not match the required pattern") unless value.matches?(Regex.new("^([a-zA-Z][-a-zA-Z0-9]*)|(arn:\\b(aws|aws-us-gov|aws-cn)\\b:[-a-zA-Z0-9:/._+]*)$"))
      end
    end

    def_equals_and_hash(@enable_termination_protection, @stack_name)
  end
end
