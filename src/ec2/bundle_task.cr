private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a bundle task.
  class BundleTask
    # The ID of the instance associated with this bundle task.
    property instance_id : String | Nil

    # The ID of the bundle task.
    property bundle_id : String | Nil

    # The state of the task.
    property state : BundleTaskState | Nil

    # The time this task started.
    property start_time : Time | Nil

    # The time of the most recent update for the task.
    property update_time : Time | Nil

    # The Amazon S3 storage locations.
    property storage : Storage | Nil

    # The level of task completion, as a percent (for example, 20%).
    property progress : String | Nil

    # If the task fails, a description of the error.
    property bundle_task_error : BundleTaskError | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @bundle_id : String | Nil = nil,
      @state : BundleTaskState | Nil = nil,
      @start_time : Time | Nil = nil,
      @update_time : Time | Nil = nil,
      @storage : Storage | Nil = nil,
      @progress : String | Nil = nil,
      @bundle_task_error : BundleTaskError | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @bundle_id
        params << {"#{prefix}BundleId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      if value = @update_time
        params << {"#{prefix}UpdateTime", Core::QueryValue.time(value)}
      end

      if value = @storage
        params.concat(value.to_query_params("#{prefix}Storage."))
      end

      if value = @progress
        params << {"#{prefix}Progress", value}
      end

      if value = @bundle_task_error
        params.concat(value.to_query_params("#{prefix}Error."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        bundle_id: Core::XMLValue.string(node.xpath_node("*[local-name()='bundleId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::BundleTaskState.from_json_object_key?(n.content) : nil,
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='startTime']")),
        update_time: Core::XMLValue.time(node.xpath_node("*[local-name()='updateTime']")),
        storage: node.xpath_node("*[local-name()='storage']").try { |n| Storage.from_xml(n) },
        progress: Core::XMLValue.string(node.xpath_node("*[local-name()='progress']")),
        bundle_task_error: node.xpath_node("*[local-name()='error']").try { |n| BundleTaskError.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @storage
        value.validate!
      end

      if value = @bundle_task_error
        value.validate!
      end
    end

    def_equals_and_hash(@instance_id, @bundle_id, @state, @start_time, @update_time, @storage, @progress, @bundle_task_error)
  end
end
