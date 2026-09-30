private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LocalGatewayRouteState
    Pending
    Active
    Blackhole
    Deleting
    Deleted

    def self.to_json(e : LocalGatewayRouteState, json : JSON::Builder) : Nil
      value = case e
              when AEC::LocalGatewayRouteState::Pending   then "pending"
              when AEC::LocalGatewayRouteState::Active    then "active"
              when AEC::LocalGatewayRouteState::Blackhole then "blackhole"
              when AEC::LocalGatewayRouteState::Deleting  then "deleting"
              when AEC::LocalGatewayRouteState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'LocalGatewayRouteState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LocalGatewayRouteState
      value = pull.read_string
      case value
      when "pending"   then AEC::LocalGatewayRouteState::Pending
      when "active"    then AEC::LocalGatewayRouteState::Active
      when "blackhole" then AEC::LocalGatewayRouteState::Blackhole
      when "deleting"  then AEC::LocalGatewayRouteState::Deleting
      when "deleted"   then AEC::LocalGatewayRouteState::Deleted
      else
        raise Exception.new("unknown enum value for 'LocalGatewayRouteState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LocalGatewayRouteState::Pending   then "pending"
      when AEC::LocalGatewayRouteState::Active    then "active"
      when AEC::LocalGatewayRouteState::Blackhole then "blackhole"
      when AEC::LocalGatewayRouteState::Deleting  then "deleting"
      when AEC::LocalGatewayRouteState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'LocalGatewayRouteState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LocalGatewayRouteState?
      case key
      when "pending"   then AEC::LocalGatewayRouteState::Pending
      when "active"    then AEC::LocalGatewayRouteState::Active
      when "blackhole" then AEC::LocalGatewayRouteState::Blackhole
      when "deleting"  then AEC::LocalGatewayRouteState::Deleting
      when "deleted"   then AEC::LocalGatewayRouteState::Deleted
      else
        nil
      end
    end
  end
end
