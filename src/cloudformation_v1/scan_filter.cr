module Amazonite::CloudFormationV1
  class ScanFilter
    property types : Array(String) | Nil

    def initialize(
      @types : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Types.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        types: node.xpath_nodes("*[local-name()='Types']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
