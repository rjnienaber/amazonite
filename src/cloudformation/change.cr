private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The `Change` structure describes the changes CloudFormation will perform if you execute the
  # change set.
  class Change
    # The type of entity that CloudFormation changes.
    #
    # - `Resource` This change is for a resource.
    property type : ChangeType | Nil

    # Is either `null`, if no Hooks invoke for the resource, or contains the number of Hooks that will
    # invoke for the resource.
    property hook_invocation_count : Int32 | Nil

    # A `ResourceChange` structure that describes the resource and action that CloudFormation will
    # perform.
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

    def validate! : Nil
      if value = @hook_invocation_count
        raise Core::ValidationError.new("HookInvocationCount value must be >= 1") if value < 1
        raise Core::ValidationError.new("HookInvocationCount value must be <= 100") if value > 100
      end

      if value = @resource_change
        value.validate!
      end
    end

    def_equals_and_hash(@type, @hook_invocation_count, @resource_change)
  end
end
