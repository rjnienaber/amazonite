private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class ListTopicsResponse
    property topics : Array(Topic) | Nil

    property next_token : String | Nil

    def initialize(
      @topics : Array(Topic) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@topics || [] of Topic).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Topics.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        topics: node.xpath_nodes("*[local-name()='Topics']/*[local-name()='member']").map { |n| Topic.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
