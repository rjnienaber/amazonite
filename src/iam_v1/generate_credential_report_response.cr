private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains the response to a successful
  # [GenerateCredentialReport](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GenerateCredentialReport.html)
  # request.
  class GenerateCredentialReportResponse
    # Information about the state of the credential report.
    property state : ReportStateType | Nil

    # Information about the credential report.
    property description : String | Nil

    def initialize(
      @state : ReportStateType | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        state: (n = node.xpath_node("*[local-name()='State']")) ? AI::ReportStateType.from_json_object_key?(n.content) : nil,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
      )
    end

    def_equals_and_hash(@state, @description)
  end
end
