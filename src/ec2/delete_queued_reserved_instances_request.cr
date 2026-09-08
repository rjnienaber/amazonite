private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteQueuedReservedInstancesRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the Reserved Instances.
    property reserved_instances_ids : Array(String) = [] of String

    def initialize(
      @reserved_instances_ids : Array(String),
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      @reserved_instances_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}ReservedInstancesId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        reserved_instances_ids: node.xpath_nodes("*[local-name()='ReservedInstancesId']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @reserved_instances_ids
        raise Core::ValidationError.new("ReservedInstancesIds must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ReservedInstancesIds must have at most 100 item(s)") if value.size > 100
      end
    end

    def_equals_and_hash(@dry_run, @reserved_instances_ids)
  end
end
