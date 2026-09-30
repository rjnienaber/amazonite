private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifySnapshotTierRequest
    # The ID of the snapshot.
    property snapshot_id : String

    # The name of the storage tier. You must specify `archive`.
    property storage_tier : TargetStorageTier | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @snapshot_id : String,
      @storage_tier : TargetStorageTier | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SnapshotId", @snapshot_id}

      if value = @storage_tier
        params << {"#{prefix}StorageTier", value.to_json_object_key}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SnapshotId']")).not_nil!,
        storage_tier: (n = node.xpath_node("*[local-name()='StorageTier']")) ? AEC::TargetStorageTier.from_json_object_key?(n.content) : nil,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@snapshot_id, @storage_tier, @dry_run)
  end
end
