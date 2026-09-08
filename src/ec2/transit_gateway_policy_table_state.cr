private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayPolicyTableState
    Pending
    Available
    Deleting
    Deleted

    def self.to_json(e : TransitGatewayPolicyTableState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayPolicyTableState::Pending   then "pending"
              when AEC::TransitGatewayPolicyTableState::Available then "available"
              when AEC::TransitGatewayPolicyTableState::Deleting  then "deleting"
              when AEC::TransitGatewayPolicyTableState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayPolicyTableState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayPolicyTableState
      value = pull.read_string
      case value
      when "pending"   then AEC::TransitGatewayPolicyTableState::Pending
      when "available" then AEC::TransitGatewayPolicyTableState::Available
      when "deleting"  then AEC::TransitGatewayPolicyTableState::Deleting
      when "deleted"   then AEC::TransitGatewayPolicyTableState::Deleted
      else
        raise Exception.new("unknown enum value for 'TransitGatewayPolicyTableState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayPolicyTableState::Pending   then "pending"
      when AEC::TransitGatewayPolicyTableState::Available then "available"
      when AEC::TransitGatewayPolicyTableState::Deleting  then "deleting"
      when AEC::TransitGatewayPolicyTableState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayPolicyTableState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayPolicyTableState?
      case key
      when "pending"   then AEC::TransitGatewayPolicyTableState::Pending
      when "available" then AEC::TransitGatewayPolicyTableState::Available
      when "deleting"  then AEC::TransitGatewayPolicyTableState::Deleting
      when "deleted"   then AEC::TransitGatewayPolicyTableState::Deleted
      else
        nil
      end
    end
  end
end
