private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeConversionTasksRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The conversion task IDs.
    property conversion_task_ids : Array(String) | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @conversion_task_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@conversion_task_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ConversionTaskId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        conversion_task_ids: node.xpath_nodes("*[local-name()='conversionTaskId']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @conversion_task_ids)
  end
end
