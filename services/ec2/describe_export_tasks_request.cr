private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeExportTasksRequest
    # the filters for the export tasks.
    property filters : Array(Filter) | Nil

    # The export task IDs.
    property export_task_ids : Array(String) | Nil

    def initialize(
      @filters : Array(Filter) | Nil = nil,
      @export_task_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      (@export_task_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ExportTaskId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        export_task_ids: node.xpath_nodes("*[local-name()='exportTaskId']/*[local-name()='ExportTaskId']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@filters, @export_task_ids)
  end
end
