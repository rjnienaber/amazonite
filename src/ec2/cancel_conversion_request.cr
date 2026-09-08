private alias Core = Amazonite::Core

module Amazonite::EC2
  class CancelConversionRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the conversion task.
    property conversion_task_id : String

    # The reason for canceling the conversion task.
    property reason_message : String | Nil

    def initialize(
      @conversion_task_id : String,
      @dry_run : Bool | Nil = nil,
      @reason_message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}ConversionTaskId", @conversion_task_id}

      if value = @reason_message
        params << {"#{prefix}ReasonMessage", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        conversion_task_id: Core::XMLValue.string(node.xpath_node("*[local-name()='conversionTaskId']")).not_nil!,
        reason_message: Core::XMLValue.string(node.xpath_node("*[local-name()='reasonMessage']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @conversion_task_id, @reason_message)
  end
end
