require "xml"

module Amazonite
  class CreateQueueResult
    property queue_url : String | Nil

    def initialize(
      @queue_url : String | Nil = nil
    )
    end

    def initialize(node : XML::Node)
      node.children.each do |n|
        case n.name
        when "QueueUrl" then self.queue_url = n.children[0].to_s
        end
      end
    end
  end
end

create_xml = %(<?xml version="1.0"?>
<CreateQueueResponse xmlns="http://queue.amazonaws.com/doc/2012-11-05/">
  <CreateQueueResult>
    <QueueUrl>https://sqs.eu-west-2.amazonaws.com/934773745852/integration_test</QueueUrl>
  </CreateQueueResult>
  <ResponseMetadata>
    <RequestId>b82f139e-2c11-587b-816c-4fb231f16634</RequestId>
  </ResponseMetadata>
</CreateQueueResponse>)

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
doc = XML.parse(create_xml, options)

queue = Amazonite::CreateQueueResult.new(doc.children[0].children[0])
p queue

puts "finished"
exit

puts doc.to_s

puts

