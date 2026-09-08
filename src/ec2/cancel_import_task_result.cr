private alias Core = Amazonite::Core

module Amazonite::EC2
  class CancelImportTaskResult
    # The ID of the task being canceled.
    property import_task_id : String | Nil

    # The current state of the task being canceled.
    property previous_state : String | Nil

    # The current state of the task being canceled.
    property state : String | Nil

    def initialize(
      @import_task_id : String | Nil = nil,
      @previous_state : String | Nil = nil,
      @state : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @import_task_id
        params << {"#{prefix}ImportTaskId", value}
      end

      if value = @previous_state
        params << {"#{prefix}PreviousState", value}
      end

      if value = @state
        params << {"#{prefix}State", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        import_task_id: Core::XMLValue.string(node.xpath_node("*[local-name()='importTaskId']")),
        previous_state: Core::XMLValue.string(node.xpath_node("*[local-name()='previousState']")),
        state: Core::XMLValue.string(node.xpath_node("*[local-name()='state']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@import_task_id, @previous_state, @state)
  end
end
