private alias AS = Amazonite::Sqs

module Amazonite::Sqs
  enum QueueAttributeName
    All
    Policy
    VisibilityTimeout
    MaximumMessageSize
    MessageRetentionPeriod
    ApproximateNumberOfMessages
    ApproximateNumberOfMessagesNotVisible
    CreatedTimestamp
    LastModifiedTimestamp
    QueueArn
    ApproximateNumberOfMessagesDelayed
    DelaySeconds
    ReceiveMessageWaitTimeSeconds
    RedrivePolicy
    FifoQueue
    ContentBasedDeduplication
    KmsMasterKeyId
    KmsDataKeyReusePeriodSeconds
    DeduplicationScope
    FifoThroughputLimit
    RedriveAllowPolicy
    SqsManagedSseEnabled

    def self.to_json(e : QueueAttributeName, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::QueueAttributeName
      value = pull.read_string
      case value
      when "All"                                   then AS::QueueAttributeName::All
      when "Policy"                                then AS::QueueAttributeName::Policy
      when "VisibilityTimeout"                     then AS::QueueAttributeName::VisibilityTimeout
      when "MaximumMessageSize"                    then AS::QueueAttributeName::MaximumMessageSize
      when "MessageRetentionPeriod"                then AS::QueueAttributeName::MessageRetentionPeriod
      when "ApproximateNumberOfMessages"           then AS::QueueAttributeName::ApproximateNumberOfMessages
      when "ApproximateNumberOfMessagesNotVisible" then AS::QueueAttributeName::ApproximateNumberOfMessagesNotVisible
      when "CreatedTimestamp"                      then AS::QueueAttributeName::CreatedTimestamp
      when "LastModifiedTimestamp"                 then AS::QueueAttributeName::LastModifiedTimestamp
      when "QueueArn"                              then AS::QueueAttributeName::QueueArn
      when "ApproximateNumberOfMessagesDelayed"    then AS::QueueAttributeName::ApproximateNumberOfMessagesDelayed
      when "DelaySeconds"                          then AS::QueueAttributeName::DelaySeconds
      when "ReceiveMessageWaitTimeSeconds"         then AS::QueueAttributeName::ReceiveMessageWaitTimeSeconds
      when "RedrivePolicy"                         then AS::QueueAttributeName::RedrivePolicy
      when "FifoQueue"                             then AS::QueueAttributeName::FifoQueue
      when "ContentBasedDeduplication"             then AS::QueueAttributeName::ContentBasedDeduplication
      when "KmsMasterKeyId"                        then AS::QueueAttributeName::KmsMasterKeyId
      when "KmsDataKeyReusePeriodSeconds"          then AS::QueueAttributeName::KmsDataKeyReusePeriodSeconds
      when "DeduplicationScope"                    then AS::QueueAttributeName::DeduplicationScope
      when "FifoThroughputLimit"                   then AS::QueueAttributeName::FifoThroughputLimit
      when "RedriveAllowPolicy"                    then AS::QueueAttributeName::RedriveAllowPolicy
      when "SqsManagedSseEnabled"                  then AS::QueueAttributeName::SqsManagedSseEnabled
      else
        raise Exception.new("unknown enum value for 'QueueAttributeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::QueueAttributeName?
      case key
      when "All"                                   then AS::QueueAttributeName::All
      when "Policy"                                then AS::QueueAttributeName::Policy
      when "VisibilityTimeout"                     then AS::QueueAttributeName::VisibilityTimeout
      when "MaximumMessageSize"                    then AS::QueueAttributeName::MaximumMessageSize
      when "MessageRetentionPeriod"                then AS::QueueAttributeName::MessageRetentionPeriod
      when "ApproximateNumberOfMessages"           then AS::QueueAttributeName::ApproximateNumberOfMessages
      when "ApproximateNumberOfMessagesNotVisible" then AS::QueueAttributeName::ApproximateNumberOfMessagesNotVisible
      when "CreatedTimestamp"                      then AS::QueueAttributeName::CreatedTimestamp
      when "LastModifiedTimestamp"                 then AS::QueueAttributeName::LastModifiedTimestamp
      when "QueueArn"                              then AS::QueueAttributeName::QueueArn
      when "ApproximateNumberOfMessagesDelayed"    then AS::QueueAttributeName::ApproximateNumberOfMessagesDelayed
      when "DelaySeconds"                          then AS::QueueAttributeName::DelaySeconds
      when "ReceiveMessageWaitTimeSeconds"         then AS::QueueAttributeName::ReceiveMessageWaitTimeSeconds
      when "RedrivePolicy"                         then AS::QueueAttributeName::RedrivePolicy
      when "FifoQueue"                             then AS::QueueAttributeName::FifoQueue
      when "ContentBasedDeduplication"             then AS::QueueAttributeName::ContentBasedDeduplication
      when "KmsMasterKeyId"                        then AS::QueueAttributeName::KmsMasterKeyId
      when "KmsDataKeyReusePeriodSeconds"          then AS::QueueAttributeName::KmsDataKeyReusePeriodSeconds
      when "DeduplicationScope"                    then AS::QueueAttributeName::DeduplicationScope
      when "FifoThroughputLimit"                   then AS::QueueAttributeName::FifoThroughputLimit
      when "RedriveAllowPolicy"                    then AS::QueueAttributeName::RedriveAllowPolicy
      when "SqsManagedSseEnabled"                  then AS::QueueAttributeName::SqsManagedSseEnabled
      else
        nil
      end
    end
  end
end
