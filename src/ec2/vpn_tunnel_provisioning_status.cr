private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpnTunnelProvisioningStatus
    Available
    Pending
    Failed

    def self.to_json(e : VpnTunnelProvisioningStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpnTunnelProvisioningStatus::Available then "available"
              when AEC::VpnTunnelProvisioningStatus::Pending   then "pending"
              when AEC::VpnTunnelProvisioningStatus::Failed    then "failed"
              else
                raise Exception.new("unknown enum value for 'VpnTunnelProvisioningStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpnTunnelProvisioningStatus
      value = pull.read_string
      case value
      when "available" then AEC::VpnTunnelProvisioningStatus::Available
      when "pending"   then AEC::VpnTunnelProvisioningStatus::Pending
      when "failed"    then AEC::VpnTunnelProvisioningStatus::Failed
      else
        raise Exception.new("unknown enum value for 'VpnTunnelProvisioningStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpnTunnelProvisioningStatus::Available then "available"
      when AEC::VpnTunnelProvisioningStatus::Pending   then "pending"
      when AEC::VpnTunnelProvisioningStatus::Failed    then "failed"
      else
        raise Exception.new("unknown enum value for 'VpnTunnelProvisioningStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpnTunnelProvisioningStatus?
      case key
      when "available" then AEC::VpnTunnelProvisioningStatus::Available
      when "pending"   then AEC::VpnTunnelProvisioningStatus::Pending
      when "failed"    then AEC::VpnTunnelProvisioningStatus::Failed
      else
        nil
      end
    end
  end
end
