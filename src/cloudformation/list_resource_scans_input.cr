private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class ListResourceScansInput
    # The token for the next set of items to return. (You received this token from a previous call.)
    property next_token : String | Nil

    # If the number of available results exceeds this maximum, the response includes a `NextToken`
    # value that you can use for the `NextToken` parameter to get the next set of results. The default
    # value is 10. The maximum value is 100.
    property max_results : Int32 | Nil

    # The scan type that you want to get summary information about. The default is `FULL`.
    property scan_type_filter : ScanType | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @scan_type_filter : ScanType | Nil = nil,
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

      if value = @scan_type_filter
        params << {"#{prefix}ScanTypeFilter", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        scan_type_filter: (n = node.xpath_node("*[local-name()='ScanTypeFilter']")) ? ACF::ScanType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@next_token, @max_results, @scan_type_filter)
  end
end
