private alias Core = Amazonite::Core

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
      @sender_fault = Core::StringUtils.to_bool(values[:sender_fault])
      @code = values[:code]
    end
  end
end
