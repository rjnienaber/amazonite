private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamAddressHistoryResult
    # A historical record for a CIDR within an IPAM scope. If the CIDR is associated with an EC2
    # instance, you will see an object in the response for the instance and one for the network
    # interface.
    property history_records : Array(IpamAddressHistoryRecord) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @history_records : Array(IpamAddressHistoryRecord) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@history_records || [] of IpamAddressHistoryRecord).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}HistoryRecordSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        history_records: node.xpath_nodes("*[local-name()='historyRecordSet']/*[local-name()='item']").map { |n| IpamAddressHistoryRecord.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @history_records
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@history_records, @next_token)
  end
end
