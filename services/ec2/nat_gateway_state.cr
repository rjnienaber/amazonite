private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NatGatewayState
    Pending
    Failed
    Available
    Deleting
    Deleted

    def self.to_json(e : NatGatewayState, json : JSON::Builder) : Nil
      value = case e
              when AEC::NatGatewayState::Pending   then "pending"
              when AEC::NatGatewayState::Failed    then "failed"
              when AEC::NatGatewayState::Available then "available"
              when AEC::NatGatewayState::Deleting  then "deleting"
              when AEC::NatGatewayState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'NatGatewayState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NatGatewayState
      value = pull.read_string
      case value
      when "pending"   then AEC::NatGatewayState::Pending
      when "failed"    then AEC::NatGatewayState::Failed
      when "available" then AEC::NatGatewayState::Available
      when "deleting"  then AEC::NatGatewayState::Deleting
      when "deleted"   then AEC::NatGatewayState::Deleted
      else
        raise Exception.new("unknown enum value for 'NatGatewayState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NatGatewayState::Pending   then "pending"
      when AEC::NatGatewayState::Failed    then "failed"
      when AEC::NatGatewayState::Available then "available"
      when AEC::NatGatewayState::Deleting  then "deleting"
      when AEC::NatGatewayState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'NatGatewayState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NatGatewayState?
      case key
      when "pending"   then AEC::NatGatewayState::Pending
      when "failed"    then AEC::NatGatewayState::Failed
      when "available" then AEC::NatGatewayState::Available
      when "deleting"  then AEC::NatGatewayState::Deleting
      when "deleted"   then AEC::NatGatewayState::Deleted
      else
        nil
      end
    end
  end
end
