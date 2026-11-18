private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayPeeringAttachmentMultipathResilienceStatus
    Pending
    Enabled
    Disabled

    def self.to_json(e : TransitGatewayPeeringAttachmentMultipathResilienceStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus::Pending  then "pending"
              when AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus::Enabled  then "enabled"
              when AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus::Disabled then "disabled"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayPeeringAttachmentMultipathResilienceStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus
      value = pull.read_string
      case value
      when "pending"  then AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus::Pending
      when "enabled"  then AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus::Enabled
      when "disabled" then AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'TransitGatewayPeeringAttachmentMultipathResilienceStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus::Pending  then "pending"
      when AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus::Enabled  then "enabled"
      when AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus::Disabled then "disabled"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayPeeringAttachmentMultipathResilienceStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus?
      case key
      when "pending"  then AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus::Pending
      when "enabled"  then AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus::Enabled
      when "disabled" then AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus::Disabled
      else
        nil
      end
    end
  end
end
