private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeBundleTasksResult
    # Information about the bundle tasks.
    property bundle_tasks : Array(BundleTask) | Nil

    def initialize(
      @bundle_tasks : Array(BundleTask) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@bundle_tasks || [] of BundleTask).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BundleInstanceTasksSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        bundle_tasks: node.xpath_nodes("*[local-name()='bundleInstanceTasksSet']/*[local-name()='item']").map { |n| BundleTask.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @bundle_tasks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@bundle_tasks)
  end
end
