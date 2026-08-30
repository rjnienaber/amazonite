private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class ListOriginationNumbersRequest
    # Token that the previous `ListOriginationNumbers` request returns.
    property next_token : String | Nil

    # The maximum number of origination numbers to return.
    property max_results : Int32 | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
      )
    end

    def_equals_and_hash(@next_token, @max_results)
  end
end
