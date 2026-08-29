private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StartResourceScanInput
    # A unique identifier for this `StartResourceScan` request. Specify this token if you plan to
    # retry requests so that CloudFormation knows that you're not attempting to start a new resource
    # scan.
    property client_request_token : String | Nil

    # The scan filters to use.
    property scan_filters : Array(ScanFilter) | Nil

    def initialize(
      @client_request_token : String | Nil = nil,
      @scan_filters : Array(ScanFilter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_request_token
        params << {"#{prefix}ClientRequestToken", value}
      end

      (@scan_filters || [] of ScanFilter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ScanFilters.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
        scan_filters: node.xpath_nodes("*[local-name()='ScanFilters']/*[local-name()='member']").map { |n| ScanFilter.from_xml(n) },
      )
    end
  end
end
