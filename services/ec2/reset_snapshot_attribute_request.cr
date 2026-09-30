private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ResetSnapshotAttributeRequest
    # The attribute to reset. Currently, only the attribute for permission to create volumes can be
    # reset.
    property attribute : SnapshotAttributeName

    # The ID of the snapshot.
    property snapshot_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @attribute : SnapshotAttributeName,
      @snapshot_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Attribute", @attribute.to_json_object_key}

      params << {"#{prefix}SnapshotId", @snapshot_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attribute: ((n = node.xpath_node("*[local-name()='Attribute']")) ? AEC::SnapshotAttributeName.from_json_object_key?(n.content) : nil).not_nil!,
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SnapshotId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@attribute, @snapshot_id, @dry_run)
  end
end
