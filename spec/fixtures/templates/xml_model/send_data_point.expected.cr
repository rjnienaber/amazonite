private alias Core = Amazonite::Core

module Amazonite::SesV1
  class SendDataPoint
    property timestamp : Time | Nil
    property delivery_attempts : Int64 | Nil
    property bounces : Int64 | Nil
    property complaints : Int64 | Nil
    property rejects : Int64 | Nil

    def initialize(
      @timestamp : Time | Nil = nil,
      @delivery_attempts : Int64 | Nil = nil,
      @bounces : Int64 | Nil = nil,
      @complaints : Int64 | Nil = nil,
      @rejects : Int64 | Nil = nil
    )
    end

    def initialize(node : XML::Node)
      node.children.each do |n|
        case n.name
        when "Timestamp"        then @timestamp = Core::StringUtils.to_time(n.children[0].to_s)
        when "DeliveryAttempts" then @delivery_attempts = Int64.new(n.children[0].to_s)
        when "Bounces"          then @bounces = Int64.new(n.children[0].to_s)
        when "Complaints"       then @complaints = Int64.new(n.children[0].to_s)
        when "Rejects"          then @rejects = Int64.new(n.children[0].to_s)
        end
      end
    end
  end
end
