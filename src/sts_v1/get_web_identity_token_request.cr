private alias Core = Amazonite::Core

module Amazonite::StsV1
  class GetWebIdentityTokenRequest
    property audience : Array(String) = [] of String

    property duration_seconds : Int32 | Nil

    property signing_algorithm : String

    property tags : Array(Tag) | Nil

    def initialize(
      @audience : Array(String),
      @signing_algorithm : String,
      @duration_seconds : Int32 | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @audience.each_with_index(1) do |item, i|
        params << {"#{prefix}Audience.member.#{i}", item}
      end

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end

      params << {"#{prefix}SigningAlgorithm", @signing_algorithm}

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        audience: node.xpath_nodes("*[local-name()='Audience']/*[local-name()='member']").map { |n| n.content },
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
        signing_algorithm: Core::XMLValue.string(node.xpath_node("*[local-name()='SigningAlgorithm']")).not_nil!,
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
