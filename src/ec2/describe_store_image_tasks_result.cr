private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeStoreImageTasksResult
    # The information about the AMI store tasks.
    property store_image_task_results : Array(StoreImageTaskResult) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @store_image_task_results : Array(StoreImageTaskResult) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@store_image_task_results || [] of StoreImageTaskResult).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StoreImageTaskResultSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        store_image_task_results: node.xpath_nodes("*[local-name()='storeImageTaskResultSet']/*[local-name()='item']").map { |n| StoreImageTaskResult.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @store_image_task_results
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@store_image_task_results, @next_token)
  end
end
