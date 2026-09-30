private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NatGatewayApplianceState
    Attaching
    Attached
    Detaching
    Detached
    AttachFailed
    DetachFailed

    def self.to_json(e : NatGatewayApplianceState, json : JSON::Builder) : Nil
      value = case e
              when AEC::NatGatewayApplianceState::Attaching    then "attaching"
              when AEC::NatGatewayApplianceState::Attached     then "attached"
              when AEC::NatGatewayApplianceState::Detaching    then "detaching"
              when AEC::NatGatewayApplianceState::Detached     then "detached"
              when AEC::NatGatewayApplianceState::AttachFailed then "attach-failed"
              when AEC::NatGatewayApplianceState::DetachFailed then "detach-failed"
              else
                raise Exception.new("unknown enum value for 'NatGatewayApplianceState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NatGatewayApplianceState
      value = pull.read_string
      case value
      when "attaching"     then AEC::NatGatewayApplianceState::Attaching
      when "attached"      then AEC::NatGatewayApplianceState::Attached
      when "detaching"     then AEC::NatGatewayApplianceState::Detaching
      when "detached"      then AEC::NatGatewayApplianceState::Detached
      when "attach-failed" then AEC::NatGatewayApplianceState::AttachFailed
      when "detach-failed" then AEC::NatGatewayApplianceState::DetachFailed
      else
        raise Exception.new("unknown enum value for 'NatGatewayApplianceState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NatGatewayApplianceState::Attaching    then "attaching"
      when AEC::NatGatewayApplianceState::Attached     then "attached"
      when AEC::NatGatewayApplianceState::Detaching    then "detaching"
      when AEC::NatGatewayApplianceState::Detached     then "detached"
      when AEC::NatGatewayApplianceState::AttachFailed then "attach-failed"
      when AEC::NatGatewayApplianceState::DetachFailed then "detach-failed"
      else
        raise Exception.new("unknown enum value for 'NatGatewayApplianceState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NatGatewayApplianceState?
      case key
      when "attaching"     then AEC::NatGatewayApplianceState::Attaching
      when "attached"      then AEC::NatGatewayApplianceState::Attached
      when "detaching"     then AEC::NatGatewayApplianceState::Detaching
      when "detached"      then AEC::NatGatewayApplianceState::Detached
      when "attach-failed" then AEC::NatGatewayApplianceState::AttachFailed
      when "detach-failed" then AEC::NatGatewayApplianceState::DetachFailed
      else
        nil
      end
    end
  end
end
