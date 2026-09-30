private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an instance state change.
  class InstanceStateChange
    # The ID of the instance.
    property instance_id : String | Nil

    # The current state of the instance.
    property current_state : InstanceState | Nil

    # The previous state of the instance.
    property previous_state : InstanceState | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @current_state : InstanceState | Nil = nil,
      @previous_state : InstanceState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @current_state
        params.concat(value.to_query_params("#{prefix}CurrentState."))
      end

      if value = @previous_state
        params.concat(value.to_query_params("#{prefix}PreviousState."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        current_state: node.xpath_node("*[local-name()='currentState']").try { |n| InstanceState.from_xml(n) },
        previous_state: node.xpath_node("*[local-name()='previousState']").try { |n| InstanceState.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @current_state
        value.validate!
      end

      if value = @previous_state
        value.validate!
      end
    end

    def_equals_and_hash(@instance_id, @current_state, @previous_state)
  end
end
