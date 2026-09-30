private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeMovingAddressesResult
    # The status for each Elastic IP address.
    property moving_address_statuses : Array(MovingAddressStatus) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @moving_address_statuses : Array(MovingAddressStatus) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@moving_address_statuses || [] of MovingAddressStatus).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MovingAddressStatusSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        moving_address_statuses: node.xpath_nodes("*[local-name()='movingAddressStatusSet']/*[local-name()='item']").map { |n| MovingAddressStatus.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @moving_address_statuses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@moving_address_statuses, @next_token)
  end
end
