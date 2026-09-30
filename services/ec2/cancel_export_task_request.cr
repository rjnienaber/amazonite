private alias Core = Amazonite::Core

module Amazonite::EC2
  class CancelExportTaskRequest
    # The ID of the export task. This is the ID returned by the `CreateInstanceExportTask` and
    # `ExportImage` operations.
    property export_task_id : String

    def initialize(
      @export_task_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ExportTaskId", @export_task_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        export_task_id: Core::XMLValue.string(node.xpath_node("*[local-name()='exportTaskId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@export_task_id)
  end
end
