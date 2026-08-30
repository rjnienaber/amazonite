module Amazonite::IamV1
  # Contains the response to a successful
  # [GetAccountSummary](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountSummary.html)
  # request.
  class GetAccountSummaryResponse
    # A set of key–value pairs containing information about IAM entity usage and IAM quotas.
    property summary_map : Hash(SummaryKeyType, Int32) | Nil

    def initialize(
      @summary_map : Hash(SummaryKeyType, Int32) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@summary_map || {} of SummaryKeyType => Int32).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}SummaryMap.entry.#{i}.key", key.to_json_object_key}
        params << {"#{prefix}SummaryMap.entry.#{i}.value", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        summary_map: node.xpath_nodes("*[local-name()='SummaryMap']/*[local-name()='entry']").each_with_object({} of SummaryKeyType => Int32) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content.to_i32 },
      )
    end

    def_equals_and_hash(@summary_map)
  end
end
