private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCapacityManagerDataExportsResult
    # Information about the data export configurations, including export settings, delivery status,
    # and recent activity.
    property capacity_manager_data_exports : Array(CapacityManagerDataExportResponse) | Nil

    # The token to use to retrieve the next page of results. This value is null when there are no more
    # results to return.
    property next_token : String | Nil

    def initialize(
      @capacity_manager_data_exports : Array(CapacityManagerDataExportResponse) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@capacity_manager_data_exports || [] of CapacityManagerDataExportResponse).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CapacityManagerDataExportSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_manager_data_exports: node.xpath_nodes("*[local-name()='capacityManagerDataExportSet']/*[local-name()='item']").map { |n| CapacityManagerDataExportResponse.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @capacity_manager_data_exports
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_manager_data_exports, @next_token)
  end
end
