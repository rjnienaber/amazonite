private alias Core = Amazonite::Core

module Amazonite::IamV1
  class AcquireRoleRequest
    property template_arn : String

    property template_minor_version : Int32 | Nil

    property replacement_values : Hash(String, ReplacementValueEntry) | Nil

    def initialize(
      @template_arn : String,
      @template_minor_version : Int32 | Nil = nil,
      @replacement_values : Hash(String, ReplacementValueEntry) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TemplateArn", @template_arn}

      if value = @template_minor_version
        params << {"#{prefix}TemplateMinorVersion", value.to_s}
      end

      (@replacement_values || {} of String => ReplacementValueEntry).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}ReplacementValues.entry.#{i}.key", key}
        params.concat(value.to_query_params("#{prefix}ReplacementValues.entry.#{i}.value."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        template_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateArn']")).not_nil!,
        template_minor_version: Core::XMLValue.i32(node.xpath_node("*[local-name()='TemplateMinorVersion']")),
        replacement_values: node.xpath_nodes("*[local-name()='ReplacementValues']/*[local-name()='entry']").each_with_object({} of String => ReplacementValueEntry) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = ReplacementValueEntry.from_xml(entry.xpath_node("*[local-name()='value']").not_nil!) },
      )
    end
  end
end
