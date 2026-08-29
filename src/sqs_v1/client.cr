private alias AS = Amazonite::SqsV1
private alias Core = Amazonite::Core

module Amazonite::SqsV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.sqs_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AmazonSQS", "sqs", "1.0", EXCEPTION_FACTORY, config)
    end

    def add_permission(input : AS::AddPermissionRequest) : Core::Response
      Log.info { "performing 'AddPermission' operation" }
      response = post("AddPermission", "/", input.to_json)
      Core::Response.new(response)
    end

    def cancel_message_move_task(input : AS::CancelMessageMoveTaskRequest) : Core::ParsedResponse(AS::CancelMessageMoveTaskResult)
      Log.info { "performing 'CancelMessageMoveTask' operation" }
      response = post("CancelMessageMoveTask", "/", input.to_json)
      Core::ParsedResponse(AS::CancelMessageMoveTaskResult).new(response)
    end

    def change_message_visibility(input : AS::ChangeMessageVisibilityRequest) : Core::Response
      Log.info { "performing 'ChangeMessageVisibility' operation" }
      response = post("ChangeMessageVisibility", "/", input.to_json)
      Core::Response.new(response)
    end

    def change_message_visibility_batch(input : AS::ChangeMessageVisibilityBatchRequest) : Core::ParsedResponse(AS::ChangeMessageVisibilityBatchResult)
      Log.info { "performing 'ChangeMessageVisibilityBatch' operation" }
      response = post("ChangeMessageVisibilityBatch", "/", input.to_json)
      Core::ParsedResponse(AS::ChangeMessageVisibilityBatchResult).new(response)
    end

    def create_queue(input : AS::CreateQueueRequest) : Core::ParsedResponse(AS::CreateQueueResult)
      Log.info { "performing 'CreateQueue' operation" }
      response = post("CreateQueue", "/", input.to_json)
      Core::ParsedResponse(AS::CreateQueueResult).new(response)
    end

    def delete_message(input : AS::DeleteMessageRequest) : Core::Response
      Log.info { "performing 'DeleteMessage' operation" }
      response = post("DeleteMessage", "/", input.to_json)
      Core::Response.new(response)
    end

    def delete_message_batch(input : AS::DeleteMessageBatchRequest) : Core::ParsedResponse(AS::DeleteMessageBatchResult)
      Log.info { "performing 'DeleteMessageBatch' operation" }
      response = post("DeleteMessageBatch", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteMessageBatchResult).new(response)
    end

    def delete_queue(input : AS::DeleteQueueRequest) : Core::Response
      Log.info { "performing 'DeleteQueue' operation" }
      response = post("DeleteQueue", "/", input.to_json)
      Core::Response.new(response)
    end

    def get_queue_attributes(input : AS::GetQueueAttributesRequest) : Core::ParsedResponse(AS::GetQueueAttributesResult)
      Log.info { "performing 'GetQueueAttributes' operation" }
      response = post("GetQueueAttributes", "/", input.to_json)
      Core::ParsedResponse(AS::GetQueueAttributesResult).new(response)
    end

    def get_queue_url(input : AS::GetQueueUrlRequest) : Core::ParsedResponse(AS::GetQueueUrlResult)
      Log.info { "performing 'GetQueueUrl' operation" }
      response = post("GetQueueUrl", "/", input.to_json)
      Core::ParsedResponse(AS::GetQueueUrlResult).new(response)
    end

    def list_dead_letter_source_queues(input : AS::ListDeadLetterSourceQueuesRequest) : Core::ParsedResponse(AS::ListDeadLetterSourceQueuesResult)
      Log.info { "performing 'ListDeadLetterSourceQueues' operation" }
      response = post("ListDeadLetterSourceQueues", "/", input.to_json)
      Core::ParsedResponse(AS::ListDeadLetterSourceQueuesResult).new(response)
    end

    def list_message_move_tasks(input : AS::ListMessageMoveTasksRequest) : Core::ParsedResponse(AS::ListMessageMoveTasksResult)
      Log.info { "performing 'ListMessageMoveTasks' operation" }
      response = post("ListMessageMoveTasks", "/", input.to_json)
      Core::ParsedResponse(AS::ListMessageMoveTasksResult).new(response)
    end

    def list_queues(input : AS::ListQueuesRequest) : Core::ParsedResponse(AS::ListQueuesResult)
      Log.info { "performing 'ListQueues' operation" }
      response = post("ListQueues", "/", input.to_json)
      Core::ParsedResponse(AS::ListQueuesResult).new(response)
    end

    def list_queue_tags(input : AS::ListQueueTagsRequest) : Core::ParsedResponse(AS::ListQueueTagsResult)
      Log.info { "performing 'ListQueueTags' operation" }
      response = post("ListQueueTags", "/", input.to_json)
      Core::ParsedResponse(AS::ListQueueTagsResult).new(response)
    end

    def purge_queue(input : AS::PurgeQueueRequest) : Core::Response
      Log.info { "performing 'PurgeQueue' operation" }
      response = post("PurgeQueue", "/", input.to_json)
      Core::Response.new(response)
    end

    def receive_message(input : AS::ReceiveMessageRequest) : Core::ParsedResponse(AS::ReceiveMessageResult)
      Log.info { "performing 'ReceiveMessage' operation" }
      response = post("ReceiveMessage", "/", input.to_json)
      Core::ParsedResponse(AS::ReceiveMessageResult).new(response)
    end

    def remove_permission(input : AS::RemovePermissionRequest) : Core::Response
      Log.info { "performing 'RemovePermission' operation" }
      response = post("RemovePermission", "/", input.to_json)
      Core::Response.new(response)
    end

    def send_message(input : AS::SendMessageRequest) : Core::ParsedResponse(AS::SendMessageResult)
      Log.info { "performing 'SendMessage' operation" }
      response = post("SendMessage", "/", input.to_json)
      Core::ParsedResponse(AS::SendMessageResult).new(response)
    end

    def send_message_batch(input : AS::SendMessageBatchRequest) : Core::ParsedResponse(AS::SendMessageBatchResult)
      Log.info { "performing 'SendMessageBatch' operation" }
      response = post("SendMessageBatch", "/", input.to_json)
      Core::ParsedResponse(AS::SendMessageBatchResult).new(response)
    end

    def set_queue_attributes(input : AS::SetQueueAttributesRequest) : Core::Response
      Log.info { "performing 'SetQueueAttributes' operation" }
      response = post("SetQueueAttributes", "/", input.to_json)
      Core::Response.new(response)
    end

    def start_message_move_task(input : AS::StartMessageMoveTaskRequest) : Core::ParsedResponse(AS::StartMessageMoveTaskResult)
      Log.info { "performing 'StartMessageMoveTask' operation" }
      response = post("StartMessageMoveTask", "/", input.to_json)
      Core::ParsedResponse(AS::StartMessageMoveTaskResult).new(response)
    end

    def tag_queue(input : AS::TagQueueRequest) : Core::Response
      Log.info { "performing 'TagQueue' operation" }
      response = post("TagQueue", "/", input.to_json)
      Core::Response.new(response)
    end

    def untag_queue(input : AS::UntagQueueRequest) : Core::Response
      Log.info { "performing 'UntagQueue' operation" }
      response = post("UntagQueue", "/", input.to_json)
      Core::Response.new(response)
    end
  end
end
