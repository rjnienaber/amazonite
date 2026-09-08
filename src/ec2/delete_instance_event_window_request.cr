private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteInstanceEventWindowRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Specify `true` to force delete the event window. Use the force delete parameter if the event
    # window is currently associated with targets.
    property force_delete : Bool | Nil

    # The ID of the event window.
    property instance_event_window_id : String

    def initialize(
      @instance_event_window_id : String,
      @dry_run : Bool | Nil = nil,
      @force_delete : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @force_delete
        params << {"#{prefix}ForceDelete", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}InstanceEventWindowId", @instance_event_window_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        force_delete: Core::XMLValue.bool(node.xpath_node("*[local-name()='ForceDelete']")),
        instance_event_window_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceEventWindowId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @force_delete, @instance_event_window_id)
  end
end
