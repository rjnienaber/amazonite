private alias Core = Amazonite::Core

module Amazonite::EC2
  # The information about the AMI store task, including the progress of the task.
  class StoreImageTaskResult
    # The ID of the AMI that is being stored.
    property ami_id : String | Nil

    # The time the task started.
    property task_start_time : Time | Nil

    # The name of the Amazon S3 bucket that contains the stored AMI object.
    property bucket : String | Nil

    # The name of the stored AMI object in the bucket.
    property s3object_key : String | Nil

    # The progress of the task as a percentage.
    property progress_percentage : Int32 | Nil

    # The state of the store task (`InProgress`, `Completed`, or `Failed`).
    property store_task_state : String | Nil

    # If the tasks fails, the reason for the failure is returned. If the task succeeds, `null` is
    # returned.
    property store_task_failure_reason : String | Nil

    def initialize(
      @ami_id : String | Nil = nil,
      @task_start_time : Time | Nil = nil,
      @bucket : String | Nil = nil,
      @s3object_key : String | Nil = nil,
      @progress_percentage : Int32 | Nil = nil,
      @store_task_state : String | Nil = nil,
      @store_task_failure_reason : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ami_id
        params << {"#{prefix}AmiId", value}
      end

      if value = @task_start_time
        params << {"#{prefix}TaskStartTime", Core::QueryValue.time(value)}
      end

      if value = @bucket
        params << {"#{prefix}Bucket", value}
      end

      if value = @s3object_key
        params << {"#{prefix}S3objectKey", value}
      end

      if value = @progress_percentage
        params << {"#{prefix}ProgressPercentage", value.to_s}
      end

      if value = @store_task_state
        params << {"#{prefix}StoreTaskState", value}
      end

      if value = @store_task_failure_reason
        params << {"#{prefix}StoreTaskFailureReason", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ami_id: Core::XMLValue.string(node.xpath_node("*[local-name()='amiId']")),
        task_start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='taskStartTime']")),
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='bucket']")),
        s3object_key: Core::XMLValue.string(node.xpath_node("*[local-name()='s3objectKey']")),
        progress_percentage: Core::XMLValue.i32(node.xpath_node("*[local-name()='progressPercentage']")),
        store_task_state: Core::XMLValue.string(node.xpath_node("*[local-name()='storeTaskState']")),
        store_task_failure_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='storeTaskFailureReason']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ami_id, @task_start_time, @bucket, @s3object_key, @progress_percentage, @store_task_state, @store_task_failure_reason)
  end
end
