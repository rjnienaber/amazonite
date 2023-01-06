module Amazonite::SqsV1
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
      node.children.each do |n|
        case n.name
        when "MessageId"              then @message_id = n.children[0].to_s
        when "ReceiptHandle"          then @receipt_handle = n.children[0].to_s
        when "MD5OfBody"              then @md5_of_body = n.children[0].to_s
        when "Body"                   then @body = n.children[0].to_s
        when "Attributes"             then @attributes = n.children[0].to_s
        when "MD5OfMessageAttributes" then @md5_of_message_attributes = n.children[0].to_s
        when "MessageAttributes"      then @message_attributes = n.children[0].to_s
        end
      end
    end
  end
end
