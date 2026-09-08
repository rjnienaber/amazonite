private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeImportImageTasksResult
    # A list of zero or more import image tasks that are currently active or were completed or
    # canceled in the previous 7 days.
    property import_image_tasks : Array(ImportImageTask) | Nil

    # The token to use to get the next page of results. This value is `null` when there are no more
    # results to return.
    property next_token : String | Nil

    def initialize(
      @import_image_tasks : Array(ImportImageTask) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@import_image_tasks || [] of ImportImageTask).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ImportImageTaskSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        import_image_tasks: node.xpath_nodes("*[local-name()='importImageTaskSet']/*[local-name()='item']").map { |n| ImportImageTask.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @import_image_tasks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@import_image_tasks, @next_token)
  end
end
