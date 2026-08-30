private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListResourceScansOutput
    # The list of scans returned.
    property resource_scan_summaries : Array(ResourceScanSummary) | Nil

    # If the request doesn't return all the remaining results, `NextToken` is set to a token. To
    # retrieve the next set of results, call `ListResourceScans` again and use that value for the
    # `NextToken` parameter. If the request returns all results, `NextToken` is set to an empty
    # string.
    property next_token : String | Nil

    def initialize(
      @resource_scan_summaries : Array(ResourceScanSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@resource_scan_summaries || [] of ResourceScanSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ResourceScanSummaries.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_scan_summaries: node.xpath_nodes("*[local-name()='ResourceScanSummaries']/*[local-name()='member']").map { |n| ResourceScanSummary.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
