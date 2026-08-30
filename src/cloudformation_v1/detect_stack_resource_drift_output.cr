private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DetectStackResourceDriftOutput
    # Information about whether the resource's actual configuration has drifted from its expected
    # template configuration, including actual and expected property values and any differences
    # detected.
    property stack_resource_drift : StackResourceDrift

    def initialize(
      @stack_resource_drift : StackResourceDrift,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@stack_resource_drift.to_query_params("#{prefix}StackResourceDrift."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_resource_drift: node.xpath_node("*[local-name()='StackResourceDrift']").try { |n| StackResourceDrift.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @stack_resource_drift
        value.validate!
      end
    end

    def_equals_and_hash(@stack_resource_drift)
  end
end
