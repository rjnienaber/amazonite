private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetHumanReadableSummaryResponse
    # Summary content in the specified locale. Summary content is non-empty only if the `SummaryState`
    # is `AVAILABLE`.
    property summary_content : String | Nil

    # The locale that this response was generated for. This maps to the input locale.
    property locale : String | Nil

    # State of summary generation. This generation process is asynchronous and this attribute
    # indicates the state of the generation process.
    property summary_state : SummaryStateType | Nil

    def initialize(
      @summary_content : String | Nil = nil,
      @locale : String | Nil = nil,
      @summary_state : SummaryStateType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @summary_content
        params << {"#{prefix}SummaryContent", value}
      end

      if value = @locale
        params << {"#{prefix}Locale", value}
      end

      if value = @summary_state
        params << {"#{prefix}SummaryState", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        summary_content: Core::XMLValue.string(node.xpath_node("*[local-name()='SummaryContent']")),
        locale: Core::XMLValue.string(node.xpath_node("*[local-name()='Locale']")),
        summary_state: (n = node.xpath_node("*[local-name()='SummaryState']")) ? AI::SummaryStateType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @summary_content
        raise Core::ValidationError.new("SummaryContent length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SummaryContent length must be <= 10000") if value.size > 10000
      end

      if value = @locale
        raise Core::ValidationError.new("Locale length must be >= 2") if value.size < 2
        raise Core::ValidationError.new("Locale length must be <= 12") if value.size > 12
      end
    end

    def_equals_and_hash(@summary_content, @locale, @summary_state)
  end
end
