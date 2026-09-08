private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetAwsNetworkPerformanceDataResult
    # The list of data responses.
    property data_responses : Array(DataResponse) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @data_responses : Array(DataResponse) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@data_responses || [] of DataResponse).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DataResponseSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        data_responses: node.xpath_nodes("*[local-name()='dataResponseSet']/*[local-name()='item']").map { |n| DataResponse.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @data_responses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@data_responses, @next_token)
  end
end
