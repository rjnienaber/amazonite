private alias Core = Amazonite::Core

module Amazonite::EC2
  class StartDeclarativePoliciesReportResult
    # The ID of the report.
    property report_id : String | Nil

    def initialize(
      @report_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @report_id
        params << {"#{prefix}ReportId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        report_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reportId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@report_id)
  end
end
