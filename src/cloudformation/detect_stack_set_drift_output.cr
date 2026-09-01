private alias Core = Amazonite::Core

module Amazonite::CloudFormation
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

    def validate! : Nil
      if value = @operation_id
        raise Core::ValidationError.new("OperationId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OperationId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("OperationId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9][-a-zA-Z0-9]*$"))
      end
    end

    def_equals_and_hash(@operation_id)
  end
end
