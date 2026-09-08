private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInstanceSqlHaHistoryStatesResult
    # Information about the historical SQL Server High Availability states of the SQL Server High
    # Availability instances.
    property instances : Array(RegisteredInstance) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @instances : Array(RegisteredInstance) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instances || [] of RegisteredInstance).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instances: node.xpath_nodes("*[local-name()='instanceSet']/*[local-name()='item']").map { |n| RegisteredInstance.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @instances
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instances, @next_token)
  end
end
