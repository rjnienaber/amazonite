private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIdFormatResult
    # Information about the ID format for the resource.
    property statuses : Array(IdFormat) | Nil

    def initialize(
      @statuses : Array(IdFormat) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@statuses || [] of IdFormat).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StatusSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        statuses: node.xpath_nodes("*[local-name()='statusSet']/*[local-name()='item']").map { |n| IdFormat.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @statuses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@statuses)
  end
end
