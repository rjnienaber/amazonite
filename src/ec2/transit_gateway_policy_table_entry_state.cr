private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayPolicyTableEntryState
    Active
    Deleted

    def self.to_json(e : TransitGatewayPolicyTableEntryState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayPolicyTableEntryState::Active  then "active"
              when AEC::TransitGatewayPolicyTableEntryState::Deleted then "deleted"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayPolicyTableEntryState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayPolicyTableEntryState
      value = pull.read_string
      case value
      when "active"  then AEC::TransitGatewayPolicyTableEntryState::Active
      when "deleted" then AEC::TransitGatewayPolicyTableEntryState::Deleted
      else
        raise Exception.new("unknown enum value for 'TransitGatewayPolicyTableEntryState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayPolicyTableEntryState::Active  then "active"
      when AEC::TransitGatewayPolicyTableEntryState::Deleted then "deleted"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayPolicyTableEntryState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayPolicyTableEntryState?
      case key
      when "active"  then AEC::TransitGatewayPolicyTableEntryState::Active
      when "deleted" then AEC::TransitGatewayPolicyTableEntryState::Deleted
      else
        nil
      end
    end
  end
end
