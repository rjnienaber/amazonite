module Amazonite::SqsV1
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
        when "MD5OfMessageAttributes"       then @md5_of_message_attributes = n.children[0].to_s
        when "MD5OfMessageSystemAttributes" then @md5_of_message_system_attributes = n.children[0].to_s
        when "SequenceNumber"               then @sequence_number = n.children[0].to_s
        end
      end

      @id = values[:id]
      @message_id = values[:message_id]
      @md5_of_message_body = values[:md5_of_message_body]
    end
  end
end
