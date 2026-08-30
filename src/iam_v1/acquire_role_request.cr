private alias Core = Amazonite::Core

module Amazonite::IamV1
  class AcquireRoleRequest
    # The Amazon Resource Name (ARN) of the role template to create the role from.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property template_arn : String

    # The minor version of the role template to use. If you do not specify a minor version, the
    # service uses the template's default minor version.
    property template_minor_version : Int32 | Nil

    # A map of values to substitute for the parameters that are defined in the role template version.
    # Each key is a parameter name from the template, and each value is a structure that contains the
    # replacement values for that parameter.
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

    def validate! : Nil
      if value = @template_arn
        raise Core::ValidationError.new("TemplateArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("TemplateArn length must be <= 2048") if value.size > 2048
      end

      if value = @replacement_values
        raise Core::ValidationError.new("ReplacementValues must have at least 0 entry(s)") if value.size < 0
        raise Core::ValidationError.new("ReplacementValues must have at most 30 entry(s)") if value.size > 30
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@template_arn, @template_minor_version, @replacement_values)
  end
end
