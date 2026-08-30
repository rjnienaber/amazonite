private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Response for ListTopics action.
  class ListTopicsResponse
    # A list of topic ARNs.
    property topics : Array(Topic) | Nil

    # Token to pass along to the next `ListTopics` request. This element is returned if there are
    # additional topics to retrieve.
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

    def validate! : Nil
      if value = @topics
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@topics, @next_token)
  end
end
