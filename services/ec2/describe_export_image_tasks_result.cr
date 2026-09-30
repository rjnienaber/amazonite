private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeExportImageTasksResult
    # Information about the export image tasks.
    property export_image_tasks : Array(ExportImageTask) | Nil

    # The token to use to get the next page of results. This value is `null` when there are no more
    # results to return.
    property next_token : String | Nil

    def initialize(
      @export_image_tasks : Array(ExportImageTask) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@export_image_tasks || [] of ExportImageTask).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ExportImageTaskSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        export_image_tasks: node.xpath_nodes("*[local-name()='exportImageTaskSet']/*[local-name()='item']").map { |n| ExportImageTask.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @export_image_tasks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@export_image_tasks, @next_token)
  end
end
