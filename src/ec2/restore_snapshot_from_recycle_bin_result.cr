private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class RestoreSnapshotFromRecycleBinResult
    # The ID of the snapshot.
    property snapshot_id : String | Nil

    # The ARN of the Outpost on which the snapshot is stored. For more information, see [Amazon EBS
    # local snapshots on
    # Outposts](https://docs.aws.amazon.com/ebs/latest/userguide/snapshots-outposts.html) in the
    # *Amazon EBS User Guide*.
    property outpost_arn : String | Nil

    # The description for the snapshot.
    property description : String | Nil

    # Indicates whether the snapshot is encrypted.
    property encrypted : Bool | Nil

    # The ID of the Amazon Web Services account that owns the EBS snapshot.
    property owner_id : String | Nil

    # The progress of the snapshot, as a percentage.
    property progress : String | Nil

    # The time stamp when the snapshot was initiated.
    property start_time : Time | Nil

    # The state of the snapshot.
    property state : SnapshotState | Nil

    # The ID of the volume that was used to create the snapshot.
    property volume_id : String | Nil

    # The size of the volume, in GiB.
    property volume_size : Int32 | Nil

    # Reserved for future use.
    property sse_type : SSEType | Nil

    def initialize(
      @snapshot_id : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @description : String | Nil = nil,
      @encrypted : Bool | Nil = nil,
      @owner_id : String | Nil = nil,
      @progress : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @state : SnapshotState | Nil = nil,
      @volume_id : String | Nil = nil,
      @volume_size : Int32 | Nil = nil,
      @sse_type : SSEType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @progress
        params << {"#{prefix}Progress", value}
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      if value = @state
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end

      if value = @volume_size
        params << {"#{prefix}VolumeSize", value.to_s}
      end

      if value = @sse_type
        params << {"#{prefix}SseType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='encrypted']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        progress: Core::XMLValue.string(node.xpath_node("*[local-name()='progress']")),
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='startTime']")),
        state: (n = node.xpath_node("*[local-name()='status']")) ? AEC::SnapshotState.from_json_object_key?(n.content) : nil,
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeId']")),
        volume_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='volumeSize']")),
        sse_type: (n = node.xpath_node("*[local-name()='sseType']")) ? AEC::SSEType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@snapshot_id, @outpost_arn, @description, @encrypted, @owner_id, @progress, @start_time, @state, @volume_id, @volume_size, @sse_type)
  end
end
