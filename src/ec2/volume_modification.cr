private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the modification status of an EBS volume.
  class VolumeModification
    # The ID of the volume.
    property volume_id : String | Nil

    # The current modification state.
    property modification_state : VolumeModificationState | Nil

    # A status message about the modification progress or failure.
    property status_message : String | Nil

    # The target size of the volume, in GiB.
    property target_size : Int32 | Nil

    # The target IOPS rate of the volume.
    property target_iops : Int32 | Nil

    # The target EBS volume type of the volume.
    property target_volume_type : VolumeType | Nil

    # The target throughput of the volume, in MiB/s.
    property target_throughput : Int32 | Nil

    # The target setting for Amazon EBS Multi-Attach.
    property target_multi_attach_enabled : Bool | Nil

    # The original size of the volume, in GiB.
    property original_size : Int32 | Nil

    # The original IOPS rate of the volume.
    property original_iops : Int32 | Nil

    # The original EBS volume type of the volume.
    property original_volume_type : VolumeType | Nil

    # The original throughput of the volume, in MiB/s.
    property original_throughput : Int32 | Nil

    # The original setting for Amazon EBS Multi-Attach.
    property original_multi_attach_enabled : Bool | Nil

    # The modification progress, from 0 to 100 percent complete.
    property progress : Int64 | Nil

    # The modification start time.
    property start_time : Time | Nil

    # The modification completion or failure time.
    property end_time : Time | Nil

    # The service provider that manages the resource.
    property operator : OperatorResponse | Nil

    def initialize(
      @volume_id : String | Nil = nil,
      @modification_state : VolumeModificationState | Nil = nil,
      @status_message : String | Nil = nil,
      @target_size : Int32 | Nil = nil,
      @target_iops : Int32 | Nil = nil,
      @target_volume_type : VolumeType | Nil = nil,
      @target_throughput : Int32 | Nil = nil,
      @target_multi_attach_enabled : Bool | Nil = nil,
      @original_size : Int32 | Nil = nil,
      @original_iops : Int32 | Nil = nil,
      @original_volume_type : VolumeType | Nil = nil,
      @original_throughput : Int32 | Nil = nil,
      @original_multi_attach_enabled : Bool | Nil = nil,
      @progress : Int64 | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @operator : OperatorResponse | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end

      if value = @modification_state
        params << {"#{prefix}ModificationState", value.to_json_object_key}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      if value = @target_size
        params << {"#{prefix}TargetSize", value.to_s}
      end

      if value = @target_iops
        params << {"#{prefix}TargetIops", value.to_s}
      end

      if value = @target_volume_type
        params << {"#{prefix}TargetVolumeType", value.to_json_object_key}
      end

      if value = @target_throughput
        params << {"#{prefix}TargetThroughput", value.to_s}
      end

      if value = @target_multi_attach_enabled
        params << {"#{prefix}TargetMultiAttachEnabled", Core::QueryValue.bool(value)}
      end

      if value = @original_size
        params << {"#{prefix}OriginalSize", value.to_s}
      end

      if value = @original_iops
        params << {"#{prefix}OriginalIops", value.to_s}
      end

      if value = @original_volume_type
        params << {"#{prefix}OriginalVolumeType", value.to_json_object_key}
      end

      if value = @original_throughput
        params << {"#{prefix}OriginalThroughput", value.to_s}
      end

      if value = @original_multi_attach_enabled
        params << {"#{prefix}OriginalMultiAttachEnabled", Core::QueryValue.bool(value)}
      end

      if value = @progress
        params << {"#{prefix}Progress", value.to_s}
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      if value = @end_time
        params << {"#{prefix}EndTime", Core::QueryValue.time(value)}
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeId']")),
        modification_state: (n = node.xpath_node("*[local-name()='modificationState']")) ? AEC::VolumeModificationState.from_json_object_key?(n.content) : nil,
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        target_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='targetSize']")),
        target_iops: Core::XMLValue.i32(node.xpath_node("*[local-name()='targetIops']")),
        target_volume_type: (n = node.xpath_node("*[local-name()='targetVolumeType']")) ? AEC::VolumeType.from_json_object_key?(n.content) : nil,
        target_throughput: Core::XMLValue.i32(node.xpath_node("*[local-name()='targetThroughput']")),
        target_multi_attach_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='targetMultiAttachEnabled']")),
        original_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='originalSize']")),
        original_iops: Core::XMLValue.i32(node.xpath_node("*[local-name()='originalIops']")),
        original_volume_type: (n = node.xpath_node("*[local-name()='originalVolumeType']")) ? AEC::VolumeType.from_json_object_key?(n.content) : nil,
        original_throughput: Core::XMLValue.i32(node.xpath_node("*[local-name()='originalThroughput']")),
        original_multi_attach_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='originalMultiAttachEnabled']")),
        progress: Core::XMLValue.i64(node.xpath_node("*[local-name()='progress']")),
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='startTime']")),
        end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='endTime']")),
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @operator
        value.validate!
      end
    end

    def_equals_and_hash(@volume_id, @modification_state, @status_message, @target_size, @target_iops, @target_volume_type, @target_throughput, @target_multi_attach_enabled, @original_size, @original_iops, @original_volume_type, @original_throughput, @original_multi_attach_enabled, @progress, @start_time, @end_time, @operator)
  end
end
