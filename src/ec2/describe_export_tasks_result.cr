private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeExportTasksResult
    # Information about the export tasks.
    property export_tasks : Array(ExportTask) | Nil

    def initialize(
      @export_tasks : Array(ExportTask) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@export_tasks || [] of ExportTask).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ExportTaskSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        export_tasks: node.xpath_nodes("*[local-name()='exportTaskSet']/*[local-name()='item']").map { |n| ExportTask.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @export_tasks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@export_tasks)
  end
end
