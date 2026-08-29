private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GenerateServiceLastAccessedDetailsRequest
    property arn : String

    property granularity : AccessAdvisorUsageGranularityType | Nil

    def initialize(
      @arn : String,
      @granularity : AccessAdvisorUsageGranularityType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Arn", @arn}

      if value = @granularity
        params << {"#{prefix}Granularity", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        granularity: (n = node.xpath_node("*[local-name()='Granularity']")) ? AI::AccessAdvisorUsageGranularityType.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
