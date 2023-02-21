module Amazonite::SesV1
  class GetSendQuotaResponse
    property max_24_hour_send : Float64 | Nil
    property max_send_rate : Float64 | Nil
    property sent_last_24_hours : Float64 | Nil

    def initialize(
      @max_24_hour_send : Float64 | Nil = nil,
      @max_send_rate : Float64 | Nil = nil,
      @sent_last_24_hours : Float64 | Nil = nil
    )
    end

    def initialize(node : XML::Node)
      node.children.each do |n|
        case n.name
        when "Max24HourSend"   then @max_24_hour_send = Float64.new(n.children[0].to_s)
        when "MaxSendRate"     then @max_send_rate = Float64.new(n.children[0].to_s)
        when "SentLast24Hours" then @sent_last_24_hours = Float64.new(n.children[0].to_s)
        end
      end
    end
  end
end
