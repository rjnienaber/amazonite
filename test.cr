require "xml"

module Amazonite::SqsV1
  class BatchResultErrorEntry
    property id : String
    property sender_fault : Bool
    property code : String
    property message : String | Nil

    def initialize(
      @id : String,
      @sender_fault : Bool,
      @code : String,
      @message : String | Nil = nil
    )
    end

    def initialize(node : XML::Node)
      values = {} of Symbol => String
      node.children.each do |n|
        case n.name
        when "Id"          then values[:id] = n.children[0].to_s
        when "SenderFault" then values[:sender_fault] = n.children[0].to_s
        when "Code"        then values[:code] = n.children[0].to_s
        when "Message"     then @message = n.children[0].to_s
        end
      end

      @id = values[:id]
      @sender_fault = /true/i.matches?(values[:sender_fault])
      @code = values[:code]
    end
  end

  class SendMessageBatchResultEntry
    property id : String
    property message_id : String
    property md5_of_message_body : String
    property md5_of_message_attributes : String | Nil
    property md5_of_message_system_attributes : String | Nil
    property sequence_number : String | Nil

    def initialize(
      @id : String,
      @message_id : String,
      @md5_of_message_body : String,
      @md5_of_message_attributes : String | Nil = nil,
      @md5_of_message_system_attributes : String | Nil = nil,
      @sequence_number : String | Nil = nil
    )
    end

    def initialize(node : XML::Node)
      values = {} of Symbol => String
      node.children.each do |n|
        case n.name
        when "Id"                           then values[:id] = n.children[0].to_s
        when "MessageId"                    then values[:message_id] = n.children[0].to_s
        when "MD5OfMessageBody"             then values[:md5_of_message_body] = n.children[0].to_s
        when "IMD5OfMessageAttributesd"     then @md5_of_message_attributes = n.children[0].to_s
        when "MD5OfMessageSystemAttributes" then @md5_of_message_system_attributes = n.children[0].to_s
        when "SequenceNumber"               then @sequence_number = n.children[0].to_s
        end
      end

      @id = values[:id]
      @message_id = values[:message_id]
      @md5_of_message_body = values[:md5_of_message_body]
    end
  end

  class SendMessageBatchResult
    property successful : Array(SendMessageBatchResultEntry)
    property failed : Array(BatchResultErrorEntry)

    def initialize(
      @successful : Array(SendMessageBatchResultEntry),
      @failed : Array(BatchResultErrorEntry)
    )
    end

    def initialize(node : XML::Node)
      @successful = [] of SendMessageBatchResultEntry
      @failed = [] of BatchResultErrorEntry
      node.children.each do |n|
        case n.name
        when "SendMessageBatchResultEntry" then self.successful << SendMessageBatchResultEntry.new(n)
        when "BatchResultErrorEntry"       then self.failed << BatchResultErrorEntry.new(n)
        end
      end
    end
  end
end

# dubious if this is the actual structure
batch_message_xml = %(<?xml version="1.0"?>
<SendMessageBatchResponse xmlns="http://queue.amazonaws.com/doc/2012-11-05/">
  <SendMessageBatchResult>
    <SendMessageBatchResultEntry>
      <Id>test_msg_001</Id>
      <MessageId>0a5231c7-8bff-4955-be2e-8dc7c50a25fa</MessageId>
      <MD5OfMessageBody>0e024d309850c78cba5eabbeff7cae71</MD5OfMessageBody>
    </SendMessageBatchResultEntry>
    <SendMessageBatchResultEntry>
      <Id>test_msg_002</Id>
      <MessageId>15ee1ed3-87e7-40c1-bdaa-2e49968ea7e9</MessageId>
      <MD5OfMessageBody>7fb8146a82f95e0af155278f406862c2</MD5OfMessageBody>
      <MD5OfMessageAttributes>295c5fa15a51aae6884d1d7c1d99ca50</MD5OfMessageAttributes>
    </SendMessageBatchResultEntry>
    <BatchResultErrorEntry>
      <Id>11</Id>
      <Code>InvalidParameterValue</Code>
      <Message>The request include parameter that is not valid for this queue type</Message>
      <SenderFault>true</SenderFault>
    </BatchResultErrorEntry>
  </SendMessageBatchResult>
  <ResponseMetadata>
    <RequestId>d26a2818-3e37-5518-9868-7434cd034ecc</RequestId>
  </ResponseMetadata>
</SendMessageBatchResponse>)

delete_message_xml = %(<DeleteMessageResponse>
  <ResponseMetadata>
    <RequestId>b5293cb5-d306-4a17-9048-b263635abe42</RequestId>
  </ResponseMetadata>
</DeleteMessageResponse>)

options = XML::ParserOptions.default | XML::ParserOptions::NOBLANKS
doc = XML.parse(batch_message_xml, options)

result = Amazonite::SqsV1::SendMessageBatchResult.new(doc.children[0].children[0])
pp result

puts "finished"
exit

puts doc.to_s

puts
