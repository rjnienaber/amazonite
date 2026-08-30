private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GenerateServiceLastAccessedDetailsRequest
    # The ARN of the IAM resource (user, group, role, or managed policy) used to generate information
    # about when the resource was last used in an attempt to access an Amazon Web Services service.
    property arn : String

    # The level of detail that you want to generate. You can specify whether you want to generate
    # information about the last attempt to access services or actions. If you specify service-level
    # granularity, this operation generates only service data. If you specify action-level
    # granularity, it generates service and action data. If you don't include this optional parameter,
    # the operation generates service data.
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

    def_equals_and_hash(@arn, @granularity)
  end
end
