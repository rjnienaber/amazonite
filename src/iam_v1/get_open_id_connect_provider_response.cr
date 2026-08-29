private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetOpenIDConnectProviderResponse
    property url : String | Nil

    property client_id_list : Array(String) | Nil

    property thumbprint_list : Array(String) | Nil

    property create_date : Time | Nil

    property tags : Array(Tag) | Nil

    def initialize(
      @url : String | Nil = nil,
      @client_id_list : Array(String) | Nil = nil,
      @thumbprint_list : Array(String) | Nil = nil,
      @create_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @url
        params << {"#{prefix}Url", value}
      end

      (@client_id_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ClientIDList.member.#{i}", item}
      end

      (@thumbprint_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ThumbprintList.member.#{i}", item}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        url: Core::XMLValue.string(node.xpath_node("*[local-name()='Url']")),
        client_id_list: node.xpath_nodes("*[local-name()='ClientIDList']/*[local-name()='member']").map { |n| n.content },
        thumbprint_list: node.xpath_nodes("*[local-name()='ThumbprintList']/*[local-name()='member']").map { |n| n.content },
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
