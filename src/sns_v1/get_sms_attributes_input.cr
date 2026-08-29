module Amazonite::SnsV1
  class GetSMSAttributesInput
    property attributes : Array(String) | Nil

    def initialize(
      @attributes : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@attributes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}attributes.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attributes: node.xpath_nodes("*[local-name()='attributes']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
