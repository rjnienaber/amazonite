private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetConsoleScreenshotRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the instance.
    property instance_id : String

    # When set to `true`, acts as keystroke input and wakes up an instance that's in standby or
    # "sleep" mode.
    property wake_up : Bool | Nil

    def initialize(
      @instance_id : String,
      @dry_run : Bool | Nil = nil,
      @wake_up : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}InstanceId", @instance_id}

      if value = @wake_up
        params << {"#{prefix}WakeUp", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        wake_up: Core::XMLValue.bool(node.xpath_node("*[local-name()='WakeUp']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @instance_id, @wake_up)
  end
end
