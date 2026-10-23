private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayAttachmentNatGatewaySupportState
    Enabled
    Disabled
    Enabling
    Disabling

    def self.to_json(e : TransitGatewayAttachmentNatGatewaySupportState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayAttachmentNatGatewaySupportState::Enabled   then "enabled"
              when AEC::TransitGatewayAttachmentNatGatewaySupportState::Disabled  then "disabled"
              when AEC::TransitGatewayAttachmentNatGatewaySupportState::Enabling  then "enabling"
              when AEC::TransitGatewayAttachmentNatGatewaySupportState::Disabling then "disabling"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayAttachmentNatGatewaySupportState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayAttachmentNatGatewaySupportState
      value = pull.read_string
      case value
      when "enabled"   then AEC::TransitGatewayAttachmentNatGatewaySupportState::Enabled
      when "disabled"  then AEC::TransitGatewayAttachmentNatGatewaySupportState::Disabled
      when "enabling"  then AEC::TransitGatewayAttachmentNatGatewaySupportState::Enabling
      when "disabling" then AEC::TransitGatewayAttachmentNatGatewaySupportState::Disabling
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAttachmentNatGatewaySupportState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayAttachmentNatGatewaySupportState::Enabled   then "enabled"
      when AEC::TransitGatewayAttachmentNatGatewaySupportState::Disabled  then "disabled"
      when AEC::TransitGatewayAttachmentNatGatewaySupportState::Enabling  then "enabling"
      when AEC::TransitGatewayAttachmentNatGatewaySupportState::Disabling then "disabling"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAttachmentNatGatewaySupportState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayAttachmentNatGatewaySupportState?
      case key
      when "enabled"   then AEC::TransitGatewayAttachmentNatGatewaySupportState::Enabled
      when "disabled"  then AEC::TransitGatewayAttachmentNatGatewaySupportState::Disabled
      when "enabling"  then AEC::TransitGatewayAttachmentNatGatewaySupportState::Enabling
      when "disabling" then AEC::TransitGatewayAttachmentNatGatewaySupportState::Disabling
      else
        nil
      end
    end
  end
end
