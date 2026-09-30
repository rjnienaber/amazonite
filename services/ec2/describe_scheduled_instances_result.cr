private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of DescribeScheduledInstances.
  class DescribeScheduledInstancesResult
    # The token required to retrieve the next set of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # Information about the Scheduled Instances.
    property scheduled_instance_set : Array(ScheduledInstance) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @scheduled_instance_set : Array(ScheduledInstance) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@scheduled_instance_set || [] of ScheduledInstance).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ScheduledInstanceSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        scheduled_instance_set: node.xpath_nodes("*[local-name()='scheduledInstanceSet']/*[local-name()='item']").map { |n| ScheduledInstance.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @scheduled_instance_set
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @scheduled_instance_set)
  end
end
