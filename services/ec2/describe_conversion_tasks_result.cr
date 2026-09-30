private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeConversionTasksResult
    # Information about the conversion tasks.
    property conversion_tasks : Array(ConversionTask) | Nil

    def initialize(
      @conversion_tasks : Array(ConversionTask) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@conversion_tasks || [] of ConversionTask).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ConversionTasks.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        conversion_tasks: node.xpath_nodes("*[local-name()='conversionTasks']/*[local-name()='item']").map { |n| ConversionTask.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @conversion_tasks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@conversion_tasks)
  end
end
