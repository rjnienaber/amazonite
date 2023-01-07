require "xml"

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
        raise Exception.new("unknown enum value for 'MessageSystemAttributeName' when serializing to json: '#{self}'")
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

  class MessageAttributeValue
    property string_value : String | Nil
    property binary_value : String | Nil
    property string_list_values : Array(String) | Nil
    property binary_list_values : Array(String) | Nil
    property data_type : String

    def initialize(
      @data_type : String,
      @string_value : String | Nil = nil,
      @binary_value : String | Nil = nil,
      @string_list_values : Array(String) | Nil = nil,
      @binary_list_values : Array(String) | Nil = nil
    )
    end

    def initialize(node : XML::Node)
      values = {} of Symbol => String
      string_list_values = [] of String
      binary_list_values = [] of String
      node.children.each do |n|
        case n.name
        when "StringValue" then @string_value = n.children[0].to_s
        when "BinaryValue" then @binary_value = n.children[0].to_s
        when "String"      then string_list_values << n.children[0].to_s
        when "Binary"      then binary_list_values << n.children[0].to_s
        when "DataType"    then values[:data_type] = n.children[0].to_s
        end
      end

      @string_list_values = string_list_values unless string_list_values.size.zero?
      @binary_list_values = binary_list_values unless binary_list_values.size.zero?
      @data_type = values[:data_type]
    end
  end

  class Message
    property message_id : String | Nil
    property receipt_handle : String | Nil
    property md5_of_body : String | Nil
    property body : String | Nil
    property attributes : Hash(MessageSystemAttributeName, String) | Nil
    property md5_of_message_attributes : String | Nil
    property message_attributes : Hash(String, MessageAttributeValue) | Nil

    def initialize(
      @message_id : String | Nil = nil,
      @receipt_handle : String | Nil = nil,
      @md5_of_body : String | Nil = nil,
      @body : String | Nil = nil,
      @attributes : Hash(MessageSystemAttributeName, String) | Nil = nil,
      @md5_of_message_attributes : String | Nil = nil,
      @message_attributes : Hash(String, MessageAttributeValue) | Nil = nil
    )
    end

    def initialize(node : XML::Node)
      attributes = {} of MessageSystemAttributeName => String
      message_attributes = {} of String => MessageAttributeValue
      node.children.each do |n|
        case n.name
        when "MessageId"              then @message_id = n.children[0].to_s
        when "ReceiptHandle"          then @receipt_handle = n.children[0].to_s
        when "MD5OfBody"              then @md5_of_body = n.children[0].to_s
        when "Body"                   then @body = n.children[0].to_s
        when "Attribute"
          key = MessageSystemAttributeName.from_string(n.children[0].children[0].to_s)
          value = n.children[1].children[0].to_s
          attributes[key] = value
        when "MD5OfMessageAttributes" then @md5_of_message_attributes = n.children[0].to_s
        when "MessageAttributes"
          key = n.children[0].children[0].to_s
          value = MessageAttributeValue.new(n.children[1])
          message_attributes[key] = value
        end
      end
      @attributes = attributes unless attributes.empty?
      @message_attributes = message_attributes unless message_attributes.empty?
    end
  end

  class ReceiveMessageResult
    property messages : Array(Message) | Nil

    def initialize(
      @messages : Array(Message) | Nil = nil
    )
    end

    def initialize(node : XML::Node)
      messages = [] of Message
      node.children.each do |n|
        case n.name
        when "Message" then messages << Message.new(n)
        end
      end

      @messages = messages unless messages.size.zero?
    end
  end
end

delete_message_xml = %(<DeleteMessageResponse>
  <ResponseMetadata>
    <RequestId>b5293cb5-d306-4a17-9048-b263635abe42</RequestId>
  </ResponseMetadata>
</DeleteMessageResponse>)

receive_message_xml = %(<ReceiveMessageResponse>
<ReceiveMessageResult>
  <Message>
    <MessageId>5fea7756-0ea4-451a-a703-a558b933e274</MessageId>
    <ReceiptHandle>
      MbZj6wDWli+JvwwJaBV+3dcjk2YW2vA3+STFFljTM8tJJg6HRG6PYSasuWXPJB+Cw
      Lj1FjgXUv1uSj1gUPAWV66FU/WeR4mq2OKpEGYWbnLmpRCJVAyeMjeU5ZBdtcQ+QE
      auMZc8ZRv37sIW2iJKq3M9MFx1YvV11A2x/KSbkJ0=
    </ReceiptHandle>
    <MD5OfBody>fafb00f5732ab283681e124bf8747ed1</MD5OfBody>
    <Body>This is a test message</Body>
    <Attribute>
      <Name>SenderId</Name>
      <Value>195004372649</Value>
    </Attribute>
    <Attribute>
      <Name>SentTimestamp</Name>
      <Value>1238099229000</Value>
    </Attribute>
    <Attribute>
      <Name>ApproximateReceiveCount</Name>
      <Value>5</Value>
    </Attribute>
    <Attribute>
      <Name>ApproximateFirstReceiveTimestamp</Name>
      <Value>1250700979248</Value>
    </Attribute>
  </Message>
</ReceiveMessageResult>
<ResponseMetadata>
  <RequestId>b6633655-283d-45b4-aee4-4e84e0ae6afa</RequestId>
</ResponseMetadata>
</ReceiveMessageResponse>)

options = XML::ParserOptions.default | XML::ParserOptions::NOBLANKS
doc = XML.parse(receive_message_xml, options)

result = Amazonite::SqsV1::ReceiveMessageResult.new(doc.children[0].children[0])
pp result



p Amazonite::SqsV1::MessageSystemAttributeName::AwsTraceHeader.to_s

puts "finished"