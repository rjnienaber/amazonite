private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DetectStackSetDriftOutput
    # The ID of the drift detection StackSet operation.
    #
    # You can use this operation ID with DescribeStackSetOperation to monitor the progress of the
    # drift detection operation.
    property operation_id : String | Nil

    def initialize(
      @operation_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @operation_id
        params << {"#{prefix}OperationId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
      )
    end
  end
end
