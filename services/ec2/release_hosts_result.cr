private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReleaseHostsResult
    # The IDs of the Dedicated Hosts that were successfully released.
    property successful : Array(String) | Nil

    # The IDs of the Dedicated Hosts that could not be released, including an error message.
    property unsuccessful : Array(UnsuccessfulItem) | Nil

    def initialize(
      @successful : Array(String) | Nil = nil,
      @unsuccessful : Array(UnsuccessfulItem) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@successful || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Successful.#{i}", item}
      end

      (@unsuccessful || [] of UnsuccessfulItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Unsuccessful.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successful: node.xpath_nodes("*[local-name()='successful']/*[local-name()='item']").map { |n| n.content },
        unsuccessful: node.xpath_nodes("*[local-name()='unsuccessful']/*[local-name()='item']").map { |n| UnsuccessfulItem.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @unsuccessful
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@successful, @unsuccessful)
  end
end
