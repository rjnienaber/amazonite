private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayRouteTableState
    Pending
    Available
    Deleting
    Deleted

    def self.to_json(e : TransitGatewayRouteTableState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayRouteTableState::Pending   then "pending"
              when AEC::TransitGatewayRouteTableState::Available then "available"
              when AEC::TransitGatewayRouteTableState::Deleting  then "deleting"
              when AEC::TransitGatewayRouteTableState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayRouteTableState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayRouteTableState
      value = pull.read_string
      case value
      when "pending"   then AEC::TransitGatewayRouteTableState::Pending
      when "available" then AEC::TransitGatewayRouteTableState::Available
      when "deleting"  then AEC::TransitGatewayRouteTableState::Deleting
      when "deleted"   then AEC::TransitGatewayRouteTableState::Deleted
      else
        raise Exception.new("unknown enum value for 'TransitGatewayRouteTableState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayRouteTableState::Pending   then "pending"
      when AEC::TransitGatewayRouteTableState::Available then "available"
      when AEC::TransitGatewayRouteTableState::Deleting  then "deleting"
      when AEC::TransitGatewayRouteTableState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayRouteTableState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayRouteTableState?
      case key
      when "pending"   then AEC::TransitGatewayRouteTableState::Pending
      when "available" then AEC::TransitGatewayRouteTableState::Available
      when "deleting"  then AEC::TransitGatewayRouteTableState::Deleting
      when "deleted"   then AEC::TransitGatewayRouteTableState::Deleted
      else
        nil
      end
    end
  end
end
