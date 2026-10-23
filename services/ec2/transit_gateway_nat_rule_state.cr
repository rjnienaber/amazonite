private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayNatRuleState
    Pending
    Activated
    Deactivated
    Deleting

    def self.to_json(e : TransitGatewayNatRuleState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayNatRuleState::Pending     then "pending"
              when AEC::TransitGatewayNatRuleState::Activated   then "activated"
              when AEC::TransitGatewayNatRuleState::Deactivated then "deactivated"
              when AEC::TransitGatewayNatRuleState::Deleting    then "deleting"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayNatRuleState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayNatRuleState
      value = pull.read_string
      case value
      when "pending"     then AEC::TransitGatewayNatRuleState::Pending
      when "activated"   then AEC::TransitGatewayNatRuleState::Activated
      when "deactivated" then AEC::TransitGatewayNatRuleState::Deactivated
      when "deleting"    then AEC::TransitGatewayNatRuleState::Deleting
      else
        raise Exception.new("unknown enum value for 'TransitGatewayNatRuleState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayNatRuleState::Pending     then "pending"
      when AEC::TransitGatewayNatRuleState::Activated   then "activated"
      when AEC::TransitGatewayNatRuleState::Deactivated then "deactivated"
      when AEC::TransitGatewayNatRuleState::Deleting    then "deleting"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayNatRuleState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayNatRuleState?
      case key
      when "pending"     then AEC::TransitGatewayNatRuleState::Pending
      when "activated"   then AEC::TransitGatewayNatRuleState::Activated
      when "deactivated" then AEC::TransitGatewayNatRuleState::Deactivated
      when "deleting"    then AEC::TransitGatewayNatRuleState::Deleting
      else
        nil
      end
    end
  end
end
