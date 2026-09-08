private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CarrierGatewayState
    Pending
    Available
    Deleting
    Deleted

    def self.to_json(e : CarrierGatewayState, json : JSON::Builder) : Nil
      value = case e
              when AEC::CarrierGatewayState::Pending   then "pending"
              when AEC::CarrierGatewayState::Available then "available"
              when AEC::CarrierGatewayState::Deleting  then "deleting"
              when AEC::CarrierGatewayState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'CarrierGatewayState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CarrierGatewayState
      value = pull.read_string
      case value
      when "pending"   then AEC::CarrierGatewayState::Pending
      when "available" then AEC::CarrierGatewayState::Available
      when "deleting"  then AEC::CarrierGatewayState::Deleting
      when "deleted"   then AEC::CarrierGatewayState::Deleted
      else
        raise Exception.new("unknown enum value for 'CarrierGatewayState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CarrierGatewayState::Pending   then "pending"
      when AEC::CarrierGatewayState::Available then "available"
      when AEC::CarrierGatewayState::Deleting  then "deleting"
      when AEC::CarrierGatewayState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'CarrierGatewayState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CarrierGatewayState?
      case key
      when "pending"   then AEC::CarrierGatewayState::Pending
      when "available" then AEC::CarrierGatewayState::Available
      when "deleting"  then AEC::CarrierGatewayState::Deleting
      when "deleted"   then AEC::CarrierGatewayState::Deleted
      else
        nil
      end
    end
  end
end
