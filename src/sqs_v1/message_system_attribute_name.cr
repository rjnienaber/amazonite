private alias AS = Amazonite::SqsV1

module Amazonite::SqsV1
  enum MessageSystemAttributeName
    All
    SenderId
    SentTimestamp
    ApproximateReceiveCount
    ApproximateFirstReceiveTimestamp
    SequenceNumber
    MessageDeduplicationId
    MessageGroupId
    AwsTraceHeader
    DeadLetterQueueSourceArn

    def self.to_json(e : MessageSystemAttributeName, json : JSON::Builder) : Nil
      value = case e
              when AS::MessageSystemAttributeName::All                              then "All"
              when AS::MessageSystemAttributeName::SenderId                         then "SenderId"
              when AS::MessageSystemAttributeName::SentTimestamp                    then "SentTimestamp"
              when AS::MessageSystemAttributeName::ApproximateReceiveCount          then "ApproximateReceiveCount"
              when AS::MessageSystemAttributeName::ApproximateFirstReceiveTimestamp then "ApproximateFirstReceiveTimestamp"
              when AS::MessageSystemAttributeName::SequenceNumber                   then "SequenceNumber"
              when AS::MessageSystemAttributeName::MessageDeduplicationId           then "MessageDeduplicationId"
              when AS::MessageSystemAttributeName::MessageGroupId                   then "MessageGroupId"
              when AS::MessageSystemAttributeName::AwsTraceHeader                   then "AWSTraceHeader"
              when AS::MessageSystemAttributeName::DeadLetterQueueSourceArn         then "DeadLetterQueueSourceArn"
              else
                raise Exception.new("unknown enum value for 'MessageSystemAttributeName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::MessageSystemAttributeName
      value = pull.read_string
      case value
      when "All"                              then AS::MessageSystemAttributeName::All
      when "SenderId"                         then AS::MessageSystemAttributeName::SenderId
      when "SentTimestamp"                    then AS::MessageSystemAttributeName::SentTimestamp
      when "ApproximateReceiveCount"          then AS::MessageSystemAttributeName::ApproximateReceiveCount
      when "ApproximateFirstReceiveTimestamp" then AS::MessageSystemAttributeName::ApproximateFirstReceiveTimestamp
      when "SequenceNumber"                   then AS::MessageSystemAttributeName::SequenceNumber
      when "MessageDeduplicationId"           then AS::MessageSystemAttributeName::MessageDeduplicationId
      when "MessageGroupId"                   then AS::MessageSystemAttributeName::MessageGroupId
      when "AWSTraceHeader"                   then AS::MessageSystemAttributeName::AwsTraceHeader
      when "DeadLetterQueueSourceArn"         then AS::MessageSystemAttributeName::DeadLetterQueueSourceArn
      else
        raise Exception.new("unknown enum value for 'MessageSystemAttributeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::MessageSystemAttributeName::All                              then "All"
      when AS::MessageSystemAttributeName::SenderId                         then "SenderId"
      when AS::MessageSystemAttributeName::SentTimestamp                    then "SentTimestamp"
      when AS::MessageSystemAttributeName::ApproximateReceiveCount          then "ApproximateReceiveCount"
      when AS::MessageSystemAttributeName::ApproximateFirstReceiveTimestamp then "ApproximateFirstReceiveTimestamp"
      when AS::MessageSystemAttributeName::SequenceNumber                   then "SequenceNumber"
      when AS::MessageSystemAttributeName::MessageDeduplicationId           then "MessageDeduplicationId"
      when AS::MessageSystemAttributeName::MessageGroupId                   then "MessageGroupId"
      when AS::MessageSystemAttributeName::AwsTraceHeader                   then "AWSTraceHeader"
      when AS::MessageSystemAttributeName::DeadLetterQueueSourceArn         then "DeadLetterQueueSourceArn"
      else
        raise Exception.new("unknown enum value for 'MessageSystemAttributeName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::MessageSystemAttributeName?
      case key
      when "All"                              then AS::MessageSystemAttributeName::All
      when "SenderId"                         then AS::MessageSystemAttributeName::SenderId
      when "SentTimestamp"                    then AS::MessageSystemAttributeName::SentTimestamp
      when "ApproximateReceiveCount"          then AS::MessageSystemAttributeName::ApproximateReceiveCount
      when "ApproximateFirstReceiveTimestamp" then AS::MessageSystemAttributeName::ApproximateFirstReceiveTimestamp
      when "SequenceNumber"                   then AS::MessageSystemAttributeName::SequenceNumber
      when "MessageDeduplicationId"           then AS::MessageSystemAttributeName::MessageDeduplicationId
      when "MessageGroupId"                   then AS::MessageSystemAttributeName::MessageGroupId
      when "AWSTraceHeader"                   then AS::MessageSystemAttributeName::AwsTraceHeader
      when "DeadLetterQueueSourceArn"         then AS::MessageSystemAttributeName::DeadLetterQueueSourceArn
      else
        nil
      end
    end
  end
end
