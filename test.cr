require "xml"
require "json"

class CreateQueueResult
  property queue_url : String | Nil

  def initialize(
    @queue_url : String | Nil = nil
  )
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
batch_message_xml = %(<SendMessageBatchResponse>
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
  </SendMessageBatchResult>
  <ResponseMetadata>
    <RequestId>ca1ad5d0-8271-408b-8d0f-1351bf547e74</RequestId>
  </ResponseMetadata>
</SendMessageBatchResponse>)

delete_message_xml = %(<DeleteMessageResponse>
  <ResponseMetadata>
    <RequestId>b5293cb5-d306-4a17-9048-b263635abe42</RequestId>
  </ResponseMetadata>
</DeleteMessageResponse>)


options = XML::ParserOptions.default | XML::ParserOptions::NOBLANKS
doc = XML.parse(batch_message_xml, options)
puts doc.to_s

puts

record XmlNode, children = Hash(String, XmlNode | String).new do
  def [](key)
    children[key]
  end
end

def output_children(nodes_set : XML::NodeSet, node = XmlNode.new) : XmlNode
  nodes_set.each do |n|
    if n.element? && n.children.size == 1 && n.children[0].text?
      node.children[n.name] = n.children[0].to_s
    elsif n.children.size != 0
      node.children[n.name] = output_children(n.children)
    end
  end
  node
end

node = output_children(doc.children)
pp node

exit