private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateFlowLogsResult
    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    property client_token : String | Nil

    # The IDs of the flow logs.
    property flow_log_ids : Array(String) | Nil

    # Information about the flow logs that could not be created successfully.
    property unsuccessful : Array(UnsuccessfulItem) | Nil

    def initialize(
      @client_token : String | Nil = nil,
      @flow_log_ids : Array(String) | Nil = nil,
      @unsuccessful : Array(UnsuccessfulItem) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      (@flow_log_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}FlowLogIdSet.#{i}", item}
      end

      (@unsuccessful || [] of UnsuccessfulItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Unsuccessful.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
        flow_log_ids: node.xpath_nodes("*[local-name()='flowLogIdSet']/*[local-name()='item']").map { |n| n.content },
        unsuccessful: node.xpath_nodes("*[local-name()='unsuccessful']/*[local-name()='item']").map { |n| UnsuccessfulItem.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @unsuccessful
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@client_token, @flow_log_ids, @unsuccessful)
  end
end
