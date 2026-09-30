private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a snapshot.
  class SnapshotInfo
    # Description specified by the CreateSnapshotRequest that has been applied to all snapshots.
    property description : String | Nil

    # Tags associated with this snapshot.
    property tags : Array(Tag) | Nil

    # Indicates whether the snapshot is encrypted.
    property encrypted : Bool | Nil

    # Source volume from which this snapshot was created.
    property volume_id : String | Nil

    # Current state of the snapshot.
    property state : SnapshotState | Nil

    # Size of the volume from which this snapshot was created.
    property volume_size : Int32 | Nil

    # Time this snapshot was started. This is the same for all snapshots initiated by the same
    # request.
    property start_time : Time | Nil

    # Progress this snapshot has made towards completing.
    property progress : String | Nil

    # Account id used when creating this snapshot.
    property owner_id : String | Nil

    # Snapshot id that can be used to describe this snapshot.
    property snapshot_id : String | Nil

    # The ARN of the Outpost on which the snapshot is stored. For more information, see [Amazon EBS
    # local snapshots on
    # Outposts](https://docs.aws.amazon.com/ebs/latest/userguide/snapshots-outposts.html) in the
    # *Amazon EBS User Guide*.
    property outpost_arn : String | Nil

    # Reserved for future use.
    property sse_type : SSEType | Nil

    # The Availability Zone or Local Zone of the snapshots. For example, `us-west-1a` (Availability
    # Zone) or `us-west-2-lax-1a` (Local Zone).
    property availability_zone : String | Nil

    def initialize(
      @description : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @encrypted : Bool | Nil = nil,
      @volume_id : String | Nil = nil,
      @state : SnapshotState | Nil = nil,
      @volume_size : Int32 | Nil = nil,
      @start_time : Time | Nil = nil,
      @progress : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @sse_type : SSEType | Nil = nil,
      @availability_zone : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @volume_size
        params << {"#{prefix}VolumeSize", value.to_s}
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      if value = @progress
        params << {"#{prefix}Progress", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @sse_type
        params << {"#{prefix}SseType", value.to_json_object_key}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='encrypted']")),
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::SnapshotState.from_json_object_key?(n.content) : nil,
        volume_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='volumeSize']")),
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='startTime']")),
        progress: Core::XMLValue.string(node.xpath_node("*[local-name()='progress']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        sse_type: (n = node.xpath_node("*[local-name()='sseType']")) ? AEC::SSEType.from_json_object_key?(n.content) : nil,
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@description, @tags, @encrypted, @volume_id, @state, @volume_size, @start_time, @progress, @owner_id, @snapshot_id, @outpost_arn, @sse_type, @availability_zone)
  end
end
