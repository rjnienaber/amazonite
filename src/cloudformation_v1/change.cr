private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class Change
    property type : ChangeType | Nil

    property hook_invocation_count : Int32 | Nil

    property resource_change : ResourceChange | Nil

    def initialize(
      @type : ChangeType | Nil = nil,
      @hook_invocation_count : Int32 | Nil = nil,
      @resource_change : ResourceChange | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @hook_invocation_count
        params << {"#{prefix}HookInvocationCount", value.to_s}
      end

      if value = @resource_change
        params.concat(value.to_query_params("#{prefix}ResourceChange."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::ChangeType.from_json_object_key?(n.content) : nil,
        hook_invocation_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='HookInvocationCount']")),
        resource_change: node.xpath_node("*[local-name()='ResourceChange']").try { |n| ResourceChange.from_xml(n) },
      )
    end
  end
end
