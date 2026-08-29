private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateOpenIDConnectProviderRequest
    property url : String

    property client_id_list : Array(String) | Nil

    property thumbprint_list : Array(String) | Nil

    property tags : Array(Tag) | Nil

    def initialize(
      @url : String,
      @client_id_list : Array(String) | Nil = nil,
      @thumbprint_list : Array(String) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Url", @url}

      (@client_id_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ClientIDList.member.#{i}", item}
      end

      (@thumbprint_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ThumbprintList.member.#{i}", item}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        url: Core::XMLValue.string(node.xpath_node("*[local-name()='Url']")).not_nil!,
        client_id_list: node.xpath_nodes("*[local-name()='ClientIDList']/*[local-name()='member']").map { |n| n.content },
        thumbprint_list: node.xpath_nodes("*[local-name()='ThumbprintList']/*[local-name()='member']").map { |n| n.content },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
