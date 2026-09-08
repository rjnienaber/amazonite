private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayState
    Pending
    Available
    Modifying
    Deleting
    Deleted

    def self.to_json(e : TransitGatewayState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayState::Pending   then "pending"
              when AEC::TransitGatewayState::Available then "available"
              when AEC::TransitGatewayState::Modifying then "modifying"
              when AEC::TransitGatewayState::Deleting  then "deleting"
              when AEC::TransitGatewayState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayState
      value = pull.read_string
      case value
      when "pending"   then AEC::TransitGatewayState::Pending
      when "available" then AEC::TransitGatewayState::Available
      when "modifying" then AEC::TransitGatewayState::Modifying
      when "deleting"  then AEC::TransitGatewayState::Deleting
      when "deleted"   then AEC::TransitGatewayState::Deleted
      else
        raise Exception.new("unknown enum value for 'TransitGatewayState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayState::Pending   then "pending"
      when AEC::TransitGatewayState::Available then "available"
      when AEC::TransitGatewayState::Modifying then "modifying"
      when AEC::TransitGatewayState::Deleting  then "deleting"
      when AEC::TransitGatewayState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayState?
      case key
      when "pending"   then AEC::TransitGatewayState::Pending
      when "available" then AEC::TransitGatewayState::Available
      when "modifying" then AEC::TransitGatewayState::Modifying
      when "deleting"  then AEC::TransitGatewayState::Deleting
      when "deleted"   then AEC::TransitGatewayState::Deleted
      else
        nil
      end
    end
  end
end
