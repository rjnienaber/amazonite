module Amazonite::SqsV1
  enum MessageSystemAttributeName
    SenderId
    SentTimestamp
    ApproximateReceiveCount
    ApproximateFirstReceiveTimestamp
    SequenceNumber
    MessageDeduplicationId
    MessageGroupId
    AwsTraceHeader

    def to_s : String
      case self
      when MessageSystemAttributeName::SenderId                         then "SenderId"
      when MessageSystemAttributeName::SentTimestamp                    then "SentTimestamp"
      when MessageSystemAttributeName::ApproximateReceiveCount          then "ApproximateReceiveCount"
      when MessageSystemAttributeName::ApproximateFirstReceiveTimestamp then "ApproximateFirstReceiveTimestamp"
      when MessageSystemAttributeName::SequenceNumber                   then "SequenceNumber"
      when MessageSystemAttributeName::MessageDeduplicationId           then "MessageDeduplicationId"
      when MessageSystemAttributeName::MessageGroupId                   then "MessageGroupId"
      when MessageSystemAttributeName::AwsTraceHeader                   then "AWSTraceHeader"
      else
        raise Exception.new("unknown enum value for 'MessageSystemAttributeName' when stringifying '#{self}'")
      end
    end

    def self.from_string(value : String) : MessageSystemAttributeName
      case value
      when "SenderId"                         then MessageSystemAttributeName::SenderId
      when "SentTimestamp"                    then MessageSystemAttributeName::SentTimestamp
      when "ApproximateReceiveCount"          then MessageSystemAttributeName::ApproximateReceiveCount
      when "ApproximateFirstReceiveTimestamp" then MessageSystemAttributeName::ApproximateFirstReceiveTimestamp
      when "SequenceNumber"                   then MessageSystemAttributeName::SequenceNumber
      when "MessageDeduplicationId"           then MessageSystemAttributeName::MessageDeduplicationId
      when "MessageGroupId"                   then MessageSystemAttributeName::MessageGroupId
      when "AWSTraceHeader"                   then MessageSystemAttributeName::AwsTraceHeader
      else
        raise Exception.new("unknown enum value for 'MessageSystemAttributeName' when parsing '#{value}'")
      end
    end
  end
end