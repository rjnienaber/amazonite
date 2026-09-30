private alias Core = Amazonite::Core

module Amazonite::EC2
  # A summary report for the attribute across all Regions.
  class AttributeSummary
    # The name of the attribute.
    property attribute_name : String | Nil

    # The configuration value that is most frequently observed for the attribute.
    property most_frequent_value : String | Nil

    # The number of accounts with the same configuration value for the attribute that is most
    # frequently observed.
    property number_of_matched_accounts : Int32 | Nil

    # The number of accounts with a configuration value different from the most frequently observed
    # value for the attribute.
    property number_of_unmatched_accounts : Int32 | Nil

    # The summary report for each Region for the attribute.
    property regional_summaries : Array(RegionalSummary) | Nil

    def initialize(
      @attribute_name : String | Nil = nil,
      @most_frequent_value : String | Nil = nil,
      @number_of_matched_accounts : Int32 | Nil = nil,
      @number_of_unmatched_accounts : Int32 | Nil = nil,
      @regional_summaries : Array(RegionalSummary) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @attribute_name
        params << {"#{prefix}AttributeName", value}
      end

      if value = @most_frequent_value
        params << {"#{prefix}MostFrequentValue", value}
      end

      if value = @number_of_matched_accounts
        params << {"#{prefix}NumberOfMatchedAccounts", value.to_s}
      end

      if value = @number_of_unmatched_accounts
        params << {"#{prefix}NumberOfUnmatchedAccounts", value.to_s}
      end

      (@regional_summaries || [] of RegionalSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RegionalSummarySet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attribute_name: Core::XMLValue.string(node.xpath_node("*[local-name()='attributeName']")),
        most_frequent_value: Core::XMLValue.string(node.xpath_node("*[local-name()='mostFrequentValue']")),
        number_of_matched_accounts: Core::XMLValue.i32(node.xpath_node("*[local-name()='numberOfMatchedAccounts']")),
        number_of_unmatched_accounts: Core::XMLValue.i32(node.xpath_node("*[local-name()='numberOfUnmatchedAccounts']")),
        regional_summaries: node.xpath_nodes("*[local-name()='regionalSummarySet']/*[local-name()='item']").map { |n| RegionalSummary.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @regional_summaries
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@attribute_name, @most_frequent_value, @number_of_matched_accounts, @number_of_unmatched_accounts, @regional_summaries)
  end
end
