private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class UpdateTerminationProtectionInput
    property enable_termination_protection : Bool

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
  end
end
