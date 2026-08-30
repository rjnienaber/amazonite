private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains the response to a successful
  # [GetCredentialReport](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetCredentialReport.html)
  # request.
  class GetCredentialReportResponse
    # Contains the credential report. The report is Base64-encoded.
    property content : Bytes | Nil

    # The format (MIME type) of the credential report.
    property report_format : ReportFormatType | Nil

    # The date and time when the credential report was created, in [ISO 8601 date-time
    # format](http://www.iso.org/iso/iso8601).
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

    def_equals_and_hash(@content, @report_format, @generated_time)
  end
end
