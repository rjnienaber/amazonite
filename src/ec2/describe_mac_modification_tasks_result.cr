private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeMacModificationTasksResult
    # Information about the tasks.
    property mac_modification_tasks : Array(MacModificationTask) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @mac_modification_tasks : Array(MacModificationTask) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@mac_modification_tasks || [] of MacModificationTask).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MacModificationTaskSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        mac_modification_tasks: node.xpath_nodes("*[local-name()='macModificationTaskSet']/*[local-name()='item']").map { |n| MacModificationTask.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @mac_modification_tasks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@mac_modification_tasks, @next_token)
  end
end
