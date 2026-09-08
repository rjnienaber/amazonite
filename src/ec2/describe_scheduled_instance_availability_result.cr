private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of DescribeScheduledInstanceAvailability.
  class DescribeScheduledInstanceAvailabilityResult
    # The token required to retrieve the next set of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # Information about the available Scheduled Instances.
    property scheduled_instance_availability_set : Array(ScheduledInstanceAvailability) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @scheduled_instance_availability_set : Array(ScheduledInstanceAvailability) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@scheduled_instance_availability_set || [] of ScheduledInstanceAvailability).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ScheduledInstanceAvailabilitySet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        scheduled_instance_availability_set: node.xpath_nodes("*[local-name()='scheduledInstanceAvailabilitySet']/*[local-name()='item']").map { |n| ScheduledInstanceAvailability.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @scheduled_instance_availability_set
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @scheduled_instance_availability_set)
  end
end
