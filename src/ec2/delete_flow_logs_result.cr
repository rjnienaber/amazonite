private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteFlowLogsResult
    # Information about the flow logs that could not be deleted successfully.
    property unsuccessful : Array(UnsuccessfulItem) | Nil

    def initialize(
      @unsuccessful : Array(UnsuccessfulItem) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@unsuccessful || [] of UnsuccessfulItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Unsuccessful.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        unsuccessful: node.xpath_nodes("*[local-name()='unsuccessful']/*[local-name()='item']").map { |n| UnsuccessfulItem.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @unsuccessful
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@unsuccessful)
  end
end
