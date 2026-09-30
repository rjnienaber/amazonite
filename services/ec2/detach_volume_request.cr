private alias Core = Amazonite::Core

module Amazonite::EC2
  class DetachVolumeRequest
    # The device name.
    property device : String | Nil

    # Forces detachment if the previous detachment attempt did not occur cleanly (for example, logging
    # into an instance, unmounting the volume, and detaching normally). This option can lead to data
    # loss or a corrupted file system. Use this option only as a last resort to detach a volume from a
    # failed instance. The instance won't have an opportunity to flush file system caches or file
    # system metadata. If you use this option, you must perform file system check and repair
    # procedures.
    property force : Bool | Nil

    # The ID of the instance. If you are detaching a Multi-Attach enabled volume, you must specify an
    # instance ID.
    property instance_id : String | Nil

    # The ID of the volume.
    property volume_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @volume_id : String,
      @device : String | Nil = nil,
      @force : Bool | Nil = nil,
      @instance_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @device
        params << {"#{prefix}Device", value}
      end

      if value = @force
        params << {"#{prefix}Force", Core::QueryValue.bool(value)}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      params << {"#{prefix}VolumeId", @volume_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        device: Core::XMLValue.string(node.xpath_node("*[local-name()='Device']")),
        force: Core::XMLValue.bool(node.xpath_node("*[local-name()='Force']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")),
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VolumeId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@device, @force, @instance_id, @volume_id, @dry_run)
  end
end
