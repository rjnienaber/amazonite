private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayRouteTableAnnouncementDirection
    Outgoing
    Incoming

    def self.to_json(e : TransitGatewayRouteTableAnnouncementDirection, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayRouteTableAnnouncementDirection::Outgoing then "outgoing"
              when AEC::TransitGatewayRouteTableAnnouncementDirection::Incoming then "incoming"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayRouteTableAnnouncementDirection' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayRouteTableAnnouncementDirection
      value = pull.read_string
      case value
      when "outgoing" then AEC::TransitGatewayRouteTableAnnouncementDirection::Outgoing
      when "incoming" then AEC::TransitGatewayRouteTableAnnouncementDirection::Incoming
      else
        raise Exception.new("unknown enum value for 'TransitGatewayRouteTableAnnouncementDirection' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayRouteTableAnnouncementDirection::Outgoing then "outgoing"
      when AEC::TransitGatewayRouteTableAnnouncementDirection::Incoming then "incoming"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayRouteTableAnnouncementDirection' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayRouteTableAnnouncementDirection?
      case key
      when "outgoing" then AEC::TransitGatewayRouteTableAnnouncementDirection::Outgoing
      when "incoming" then AEC::TransitGatewayRouteTableAnnouncementDirection::Incoming
      else
        nil
      end
    end
  end
end
