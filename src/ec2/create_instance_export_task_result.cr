private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateInstanceExportTaskResult
    # Information about the export instance task.
    property export_task : ExportTask | Nil

    def initialize(
      @export_task : ExportTask | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @export_task
        params.concat(value.to_query_params("#{prefix}ExportTask."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        export_task: node.xpath_node("*[local-name()='exportTask']").try { |n| ExportTask.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @export_task
        value.validate!
      end
    end

    def_equals_and_hash(@export_task)
  end
end
