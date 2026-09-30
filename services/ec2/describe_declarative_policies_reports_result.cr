private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeDeclarativePoliciesReportsResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # The report metadata.
    property reports : Array(DeclarativePoliciesReport) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @reports : Array(DeclarativePoliciesReport) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@reports || [] of DeclarativePoliciesReport).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ReportSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        reports: node.xpath_nodes("*[local-name()='reportSet']/*[local-name()='item']").map { |n| DeclarativePoliciesReport.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @reports
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @reports)
  end
end
