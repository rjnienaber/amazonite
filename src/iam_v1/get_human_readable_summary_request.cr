private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetHumanReadableSummaryRequest
    # Arn of the entity to be summarized. At this time, the only supported entity type is
    # `delegation-request`
    property entity_arn : String

    # A string representing the locale to use for the summary generation. The supported locale strings
    # are based on the [ Supported languages of the Amazon Web Services Management Console
    # ](/awsconsolehelpdocs/latest/gsg/change-language.html#supported-languages).
    property locale : String | Nil

    def initialize(
      @entity_arn : String,
      @locale : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}EntityArn", @entity_arn}

      if value = @locale
        params << {"#{prefix}Locale", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        entity_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='EntityArn']")).not_nil!,
        locale: Core::XMLValue.string(node.xpath_node("*[local-name()='Locale']")),
      )
    end

    def_equals_and_hash(@entity_arn, @locale)
  end
end
