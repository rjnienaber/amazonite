private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeReplaceRootVolumeTasksResult
    # Information about the root volume replacement task.
    property replace_root_volume_tasks : Array(ReplaceRootVolumeTask) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @replace_root_volume_tasks : Array(ReplaceRootVolumeTask) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@replace_root_volume_tasks || [] of ReplaceRootVolumeTask).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ReplaceRootVolumeTaskSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        replace_root_volume_tasks: node.xpath_nodes("*[local-name()='replaceRootVolumeTaskSet']/*[local-name()='item']").map { |n| ReplaceRootVolumeTask.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @replace_root_volume_tasks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@replace_root_volume_tasks, @next_token)
  end
end
