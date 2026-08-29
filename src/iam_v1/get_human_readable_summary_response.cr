private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetHumanReadableSummaryResponse
    property summary_content : String | Nil

    property locale : String | Nil

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
  end
end
