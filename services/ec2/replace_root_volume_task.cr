private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a root volume replacement task.
  class ReplaceRootVolumeTask
    # The ID of the root volume replacement task.
    property replace_root_volume_task_id : String | Nil

    # The ID of the instance for which the root volume replacement task was created.
    property instance_id : String | Nil

    # The state of the task. The task can be in one of the following states:
    #
    # - `pending` - the replacement volume is being created.
    #
    # - `in-progress` - the original volume is being detached and the replacement volume is being
    # attached.
    #
    # - `succeeded` - the replacement volume has been successfully attached to the instance and the
    # instance is available.
    #
    # - `failing` - the replacement task is in the process of failing.
    #
    # - `failed` - the replacement task has failed but the original root volume is still attached.
    #
    # - `failing-detached` - the replacement task is in the process of failing. The instance might
    # have no root volume attached.
    #
    # - `failed-detached` - the replacement task has failed and the instance has no root volume
    # attached.
    property task_state : ReplaceRootVolumeTaskState | Nil

    # The time the task was started.
    property start_time : String | Nil

    # The time the task completed.
    property complete_time : String | Nil

    # The tags assigned to the task.
    property tags : Array(Tag) | Nil

    # The ID of the AMI used to create the replacement root volume.
    property image_id : String | Nil

    # The ID of the snapshot used to create the replacement root volume.
    property snapshot_id : String | Nil

    # Indicates whether the original root volume is to be deleted after the root volume replacement
    # task completes.
    property delete_replaced_root_volume : Bool | Nil

    def initialize(
      @replace_root_volume_task_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @task_state : ReplaceRootVolumeTaskState | Nil = nil,
      @start_time : String | Nil = nil,
      @complete_time : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @image_id : String | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @delete_replaced_root_volume : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @replace_root_volume_task_id
        params << {"#{prefix}ReplaceRootVolumeTaskId", value}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @task_state
        params << {"#{prefix}TaskState", value.to_json_object_key}
      end

      if value = @start_time
        params << {"#{prefix}StartTime", value}
      end

      if value = @complete_time
        params << {"#{prefix}CompleteTime", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @delete_replaced_root_volume
        params << {"#{prefix}DeleteReplacedRootVolume", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        replace_root_volume_task_id: Core::XMLValue.string(node.xpath_node("*[local-name()='replaceRootVolumeTaskId']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        task_state: (n = node.xpath_node("*[local-name()='taskState']")) ? AEC::ReplaceRootVolumeTaskState.from_json_object_key?(n.content) : nil,
        start_time: Core::XMLValue.string(node.xpath_node("*[local-name()='startTime']")),
        complete_time: Core::XMLValue.string(node.xpath_node("*[local-name()='completeTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        delete_replaced_root_volume: Core::XMLValue.bool(node.xpath_node("*[local-name()='deleteReplacedRootVolume']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@replace_root_volume_task_id, @instance_id, @task_state, @start_time, @complete_time, @tags, @image_id, @snapshot_id, @delete_replaced_root_volume)
  end
end
