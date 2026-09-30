private alias Core = Amazonite::Core

module Amazonite::EC2
  class CancelImportTaskRequest
    # The reason for canceling the task.
    property cancel_reason : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the import image or import snapshot task to be canceled.
    property import_task_id : String | Nil

    def initialize(
      @cancel_reason : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @import_task_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cancel_reason
        params << {"#{prefix}CancelReason", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @import_task_id
        params << {"#{prefix}ImportTaskId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cancel_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='CancelReason']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        import_task_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImportTaskId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cancel_reason, @dry_run, @import_task_id)
  end
end
