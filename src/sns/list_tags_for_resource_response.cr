private alias Core = Amazonite::Core

module Amazonite::Sns
  class ListTagsForResourceResponse
    # The tags associated with the specified topic.
    property tags : Array(Tag) | Nil

    def initialize(
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@tags)
  end
end
