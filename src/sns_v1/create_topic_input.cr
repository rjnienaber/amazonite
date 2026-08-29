private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class CreateTopicInput
    property name : String

    property attributes : Hash(String, String) | Nil

    property tags : Array(Tag) | Nil

    property data_protection_policy : String | Nil

    def initialize(
      @name : String,
      @attributes : Hash(String, String) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @data_protection_policy : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Name", @name}

      (@attributes || {} of String => String).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}Attributes.entry.#{i}.key", key}
        params << {"#{prefix}Attributes.entry.#{i}.value", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end

      if value = @data_protection_policy
        params << {"#{prefix}DataProtectionPolicy", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")).not_nil!,
        attributes: node.xpath_nodes("*[local-name()='Attributes']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        data_protection_policy: Core::XMLValue.string(node.xpath_node("*[local-name()='DataProtectionPolicy']")),
      )
    end
  end
end
