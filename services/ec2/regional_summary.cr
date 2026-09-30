private alias Core = Amazonite::Core

module Amazonite::EC2
  # A summary report for the attribute for a Region.
  class RegionalSummary
    # The Amazon Web Services Region.
    property region_name : String | Nil

    # The number of accounts in the Region with the same configuration value for the attribute that is
    # most frequently observed.
    property number_of_matched_accounts : Int32 | Nil

    # The number of accounts in the Region with a configuration value different from the most
    # frequently observed value for the attribute.
    property number_of_unmatched_accounts : Int32 | Nil

    def initialize(
      @region_name : String | Nil = nil,
      @number_of_matched_accounts : Int32 | Nil = nil,
      @number_of_unmatched_accounts : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @region_name
        params << {"#{prefix}RegionName", value}
      end

      if value = @number_of_matched_accounts
        params << {"#{prefix}NumberOfMatchedAccounts", value.to_s}
      end

      if value = @number_of_unmatched_accounts
        params << {"#{prefix}NumberOfUnmatchedAccounts", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        region_name: Core::XMLValue.string(node.xpath_node("*[local-name()='regionName']")),
        number_of_matched_accounts: Core::XMLValue.i32(node.xpath_node("*[local-name()='numberOfMatchedAccounts']")),
        number_of_unmatched_accounts: Core::XMLValue.i32(node.xpath_node("*[local-name()='numberOfUnmatchedAccounts']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@region_name, @number_of_matched_accounts, @number_of_unmatched_accounts)
  end
end
