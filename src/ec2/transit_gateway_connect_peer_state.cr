private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayConnectPeerState
    Pending
    Available
    Deleting
    Deleted

    def self.to_json(e : TransitGatewayConnectPeerState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayConnectPeerState::Pending   then "pending"
              when AEC::TransitGatewayConnectPeerState::Available then "available"
              when AEC::TransitGatewayConnectPeerState::Deleting  then "deleting"
              when AEC::TransitGatewayConnectPeerState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayConnectPeerState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayConnectPeerState
      value = pull.read_string
      case value
      when "pending"   then AEC::TransitGatewayConnectPeerState::Pending
      when "available" then AEC::TransitGatewayConnectPeerState::Available
      when "deleting"  then AEC::TransitGatewayConnectPeerState::Deleting
      when "deleted"   then AEC::TransitGatewayConnectPeerState::Deleted
      else
        raise Exception.new("unknown enum value for 'TransitGatewayConnectPeerState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayConnectPeerState::Pending   then "pending"
      when AEC::TransitGatewayConnectPeerState::Available then "available"
      when AEC::TransitGatewayConnectPeerState::Deleting  then "deleting"
      when AEC::TransitGatewayConnectPeerState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayConnectPeerState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayConnectPeerState?
      case key
      when "pending"   then AEC::TransitGatewayConnectPeerState::Pending
      when "available" then AEC::TransitGatewayConnectPeerState::Available
      when "deleting"  then AEC::TransitGatewayConnectPeerState::Deleting
      when "deleted"   then AEC::TransitGatewayConnectPeerState::Deleted
      else
        nil
      end
    end
  end
end
