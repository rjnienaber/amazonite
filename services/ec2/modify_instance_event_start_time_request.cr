private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceEventStartTimeRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the instance with the scheduled event.
    property instance_id : String

    # The ID of the event whose date and time you are modifying.
    property instance_event_id : String

    # The new date and time when the event will take place.
    property not_before : Time

    def initialize(
      @instance_id : String,
      @instance_event_id : String,
      @not_before : Time,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}InstanceId", @instance_id}

      params << {"#{prefix}InstanceEventId", @instance_event_id}

      params << {"#{prefix}NotBefore", Core::QueryValue.time(@not_before)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        instance_event_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceEventId']")).not_nil!,
        not_before: Core::XMLValue.time(node.xpath_node("*[local-name()='NotBefore']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @instance_id, @instance_event_id, @not_before)
  end
end
