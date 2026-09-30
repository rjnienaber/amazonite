private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayMeteringPolicyState
    Available
    Deleted
    Pending
    Modifying
    Deleting

    def self.to_json(e : TransitGatewayMeteringPolicyState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayMeteringPolicyState::Available then "available"
              when AEC::TransitGatewayMeteringPolicyState::Deleted   then "deleted"
              when AEC::TransitGatewayMeteringPolicyState::Pending   then "pending"
              when AEC::TransitGatewayMeteringPolicyState::Modifying then "modifying"
              when AEC::TransitGatewayMeteringPolicyState::Deleting  then "deleting"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayMeteringPolicyState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayMeteringPolicyState
      value = pull.read_string
      case value
      when "available" then AEC::TransitGatewayMeteringPolicyState::Available
      when "deleted"   then AEC::TransitGatewayMeteringPolicyState::Deleted
      when "pending"   then AEC::TransitGatewayMeteringPolicyState::Pending
      when "modifying" then AEC::TransitGatewayMeteringPolicyState::Modifying
      when "deleting"  then AEC::TransitGatewayMeteringPolicyState::Deleting
      else
        raise Exception.new("unknown enum value for 'TransitGatewayMeteringPolicyState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayMeteringPolicyState::Available then "available"
      when AEC::TransitGatewayMeteringPolicyState::Deleted   then "deleted"
      when AEC::TransitGatewayMeteringPolicyState::Pending   then "pending"
      when AEC::TransitGatewayMeteringPolicyState::Modifying then "modifying"
      when AEC::TransitGatewayMeteringPolicyState::Deleting  then "deleting"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayMeteringPolicyState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayMeteringPolicyState?
      case key
      when "available" then AEC::TransitGatewayMeteringPolicyState::Available
      when "deleted"   then AEC::TransitGatewayMeteringPolicyState::Deleted
      when "pending"   then AEC::TransitGatewayMeteringPolicyState::Pending
      when "modifying" then AEC::TransitGatewayMeteringPolicyState::Modifying
      when "deleting"  then AEC::TransitGatewayMeteringPolicyState::Deleting
      else
        nil
      end
    end
  end
end
