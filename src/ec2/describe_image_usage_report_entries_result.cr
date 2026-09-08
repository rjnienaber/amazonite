private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeImageUsageReportEntriesResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # The content of the usage reports.
    property image_usage_report_entries : Array(ImageUsageReportEntry) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @image_usage_report_entries : Array(ImageUsageReportEntry) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@image_usage_report_entries || [] of ImageUsageReportEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ImageUsageReportEntrySet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        image_usage_report_entries: node.xpath_nodes("*[local-name()='imageUsageReportEntrySet']/*[local-name()='item']").map { |n| ImageUsageReportEntry.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @image_usage_report_entries
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @image_usage_report_entries)
  end
end
