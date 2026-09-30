private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NatGatewayApplianceModifyState
    Modifying
    Completed
    Failed

    def self.to_json(e : NatGatewayApplianceModifyState, json : JSON::Builder) : Nil
      value = case e
              when AEC::NatGatewayApplianceModifyState::Modifying then "modifying"
              when AEC::NatGatewayApplianceModifyState::Completed then "completed"
              when AEC::NatGatewayApplianceModifyState::Failed    then "failed"
              else
                raise Exception.new("unknown enum value for 'NatGatewayApplianceModifyState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NatGatewayApplianceModifyState
      value = pull.read_string
      case value
      when "modifying" then AEC::NatGatewayApplianceModifyState::Modifying
      when "completed" then AEC::NatGatewayApplianceModifyState::Completed
      when "failed"    then AEC::NatGatewayApplianceModifyState::Failed
      else
        raise Exception.new("unknown enum value for 'NatGatewayApplianceModifyState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NatGatewayApplianceModifyState::Modifying then "modifying"
      when AEC::NatGatewayApplianceModifyState::Completed then "completed"
      when AEC::NatGatewayApplianceModifyState::Failed    then "failed"
      else
        raise Exception.new("unknown enum value for 'NatGatewayApplianceModifyState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NatGatewayApplianceModifyState?
      case key
      when "modifying" then AEC::NatGatewayApplianceModifyState::Modifying
      when "completed" then AEC::NatGatewayApplianceModifyState::Completed
      when "failed"    then AEC::NatGatewayApplianceModifyState::Failed
      else
        nil
      end
    end
  end
end
