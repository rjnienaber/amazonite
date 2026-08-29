private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  class StackInstanceComprehensiveStatus
    property detailed_status : StackInstanceDetailedStatus | Nil

    def initialize(
      @detailed_status : StackInstanceDetailedStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @detailed_status
        params << {"#{prefix}DetailedStatus", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        detailed_status: (n = node.xpath_node("*[local-name()='DetailedStatus']")) ? ACF::StackInstanceDetailedStatus.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
