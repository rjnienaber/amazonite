private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVolumeAttributeRequest
    # Indicates whether the volume should be auto-enabled for I/O operations.
    property auto_enable_io : AttributeBooleanValue | Nil

    # The ID of the volume.
    property volume_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @volume_id : String,
      @auto_enable_io : AttributeBooleanValue | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @auto_enable_io
        params.concat(value.to_query_params("#{prefix}AutoEnableIO."))
      end

      params << {"#{prefix}VolumeId", @volume_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        auto_enable_io: node.xpath_node("*[local-name()='AutoEnableIO']").try { |n| AttributeBooleanValue.from_xml(n) },
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VolumeId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @auto_enable_io
        value.validate!
      end
    end

    def_equals_and_hash(@auto_enable_io, @volume_id, @dry_run)
  end
end
