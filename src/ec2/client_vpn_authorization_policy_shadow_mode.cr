private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Indicates whether the authorization policy for a Client VPN endpoint is evaluated in shadow
  # mode. Possible values include:
  #
  # - `enabled` - The authorization policy is evaluated and the results are logged, but access is
  # not enforced.
  #
  # - `disabled` - The authorization policy is enforced.
  enum ClientVpnAuthorizationPolicyShadowMode
    Enabled
    Disabled

    def self.to_json(e : ClientVpnAuthorizationPolicyShadowMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::ClientVpnAuthorizationPolicyShadowMode::Enabled  then "enabled"
              when AEC::ClientVpnAuthorizationPolicyShadowMode::Disabled then "disabled"
              else
                raise Exception.new("unknown enum value for 'ClientVpnAuthorizationPolicyShadowMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ClientVpnAuthorizationPolicyShadowMode
      value = pull.read_string
      case value
      when "enabled"  then AEC::ClientVpnAuthorizationPolicyShadowMode::Enabled
      when "disabled" then AEC::ClientVpnAuthorizationPolicyShadowMode::Disabled
      else
        raise Exception.new("unknown enum value for 'ClientVpnAuthorizationPolicyShadowMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ClientVpnAuthorizationPolicyShadowMode::Enabled  then "enabled"
      when AEC::ClientVpnAuthorizationPolicyShadowMode::Disabled then "disabled"
      else
        raise Exception.new("unknown enum value for 'ClientVpnAuthorizationPolicyShadowMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ClientVpnAuthorizationPolicyShadowMode?
      case key
      when "enabled"  then AEC::ClientVpnAuthorizationPolicyShadowMode::Enabled
      when "disabled" then AEC::ClientVpnAuthorizationPolicyShadowMode::Disabled
      else
        nil
      end
    end
  end
end
