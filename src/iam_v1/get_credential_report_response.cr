private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetCredentialReportResponse
    property content : Bytes | Nil

    property report_format : ReportFormatType | Nil

    property generated_time : Time | Nil

    def initialize(
      @content : Bytes | Nil = nil,
      @report_format : ReportFormatType | Nil = nil,
      @generated_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @content
        params << {"#{prefix}Content", Core::QueryValue.bytes(value)}
      end

      if value = @report_format
        params << {"#{prefix}ReportFormat", value.to_json_object_key}
      end

      if value = @generated_time
        params << {"#{prefix}GeneratedTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        content: Core::XMLValue.bytes(node.xpath_node("*[local-name()='Content']")),
        report_format: (n = node.xpath_node("*[local-name()='ReportFormat']")) ? AI::ReportFormatType.from_json_object_key?(n.content) : nil,
        generated_time: Core::XMLValue.time(node.xpath_node("*[local-name()='GeneratedTime']")),
      )
    end
  end
end
