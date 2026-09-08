private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayPropagationState
    Enabling
    Enabled
    Disabling
    Disabled

    def self.to_json(e : TransitGatewayPropagationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayPropagationState::Enabling  then "enabling"
              when AEC::TransitGatewayPropagationState::Enabled   then "enabled"
              when AEC::TransitGatewayPropagationState::Disabling then "disabling"
              when AEC::TransitGatewayPropagationState::Disabled  then "disabled"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayPropagationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayPropagationState
      value = pull.read_string
      case value
      when "enabling"  then AEC::TransitGatewayPropagationState::Enabling
      when "enabled"   then AEC::TransitGatewayPropagationState::Enabled
      when "disabling" then AEC::TransitGatewayPropagationState::Disabling
      when "disabled"  then AEC::TransitGatewayPropagationState::Disabled
      else
        raise Exception.new("unknown enum value for 'TransitGatewayPropagationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayPropagationState::Enabling  then "enabling"
      when AEC::TransitGatewayPropagationState::Enabled   then "enabled"
      when AEC::TransitGatewayPropagationState::Disabling then "disabling"
      when AEC::TransitGatewayPropagationState::Disabled  then "disabled"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayPropagationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayPropagationState?
      case key
      when "enabling"  then AEC::TransitGatewayPropagationState::Enabling
      when "enabled"   then AEC::TransitGatewayPropagationState::Enabled
      when "disabling" then AEC::TransitGatewayPropagationState::Disabling
      when "disabled"  then AEC::TransitGatewayPropagationState::Disabled
      else
        nil
      end
    end
  end
end
