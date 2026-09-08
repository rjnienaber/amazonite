private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableFastSnapshotRestoresRequest
    # One or more Availability Zones. For example, `us-east-2a`.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified in the request, but not
    # both.
    property availability_zones : Array(String) | Nil

    # One or more Availability Zone IDs. For example, `use2-az1`.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified in the request, but not
    # both.
    property availability_zone_ids : Array(String) | Nil

    # The IDs of one or more snapshots. For example, `snap-1234567890abcdef0`.
    property source_snapshot_ids : Array(String) = [] of String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @source_snapshot_ids : Array(String),
      @availability_zones : Array(String) | Nil = nil,
      @availability_zone_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@availability_zones || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZone.#{i}", item}
      end

      (@availability_zone_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneId.#{i}", item}
      end

      @source_snapshot_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}SourceSnapshotId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zones: node.xpath_nodes("*[local-name()='AvailabilityZone']/*[local-name()='AvailabilityZone']").map { |n| n.content },
        availability_zone_ids: node.xpath_nodes("*[local-name()='AvailabilityZoneId']/*[local-name()='AvailabilityZoneId']").map { |n| n.content },
        source_snapshot_ids: node.xpath_nodes("*[local-name()='SourceSnapshotId']/*[local-name()='SnapshotId']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@availability_zones, @availability_zone_ids, @source_snapshot_ids, @dry_run)
  end
end
