private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayRouteState
    Pending
    Active
    Blackhole
    Deleting
    Deleted

    def self.to_json(e : TransitGatewayRouteState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayRouteState::Pending   then "pending"
              when AEC::TransitGatewayRouteState::Active    then "active"
              when AEC::TransitGatewayRouteState::Blackhole then "blackhole"
              when AEC::TransitGatewayRouteState::Deleting  then "deleting"
              when AEC::TransitGatewayRouteState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayRouteState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayRouteState
      value = pull.read_string
      case value
      when "pending"   then AEC::TransitGatewayRouteState::Pending
      when "active"    then AEC::TransitGatewayRouteState::Active
      when "blackhole" then AEC::TransitGatewayRouteState::Blackhole
      when "deleting"  then AEC::TransitGatewayRouteState::Deleting
      when "deleted"   then AEC::TransitGatewayRouteState::Deleted
      else
        raise Exception.new("unknown enum value for 'TransitGatewayRouteState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayRouteState::Pending   then "pending"
      when AEC::TransitGatewayRouteState::Active    then "active"
      when AEC::TransitGatewayRouteState::Blackhole then "blackhole"
      when AEC::TransitGatewayRouteState::Deleting  then "deleting"
      when AEC::TransitGatewayRouteState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayRouteState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayRouteState?
      case key
      when "pending"   then AEC::TransitGatewayRouteState::Pending
      when "active"    then AEC::TransitGatewayRouteState::Active
      when "blackhole" then AEC::TransitGatewayRouteState::Blackhole
      when "deleting"  then AEC::TransitGatewayRouteState::Deleting
      when "deleted"   then AEC::TransitGatewayRouteState::Deleted
      else
        nil
      end
    end
  end
end
