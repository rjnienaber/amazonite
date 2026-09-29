private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes the state of an authorization policy for a Client VPN endpoint. Possible states
  # include:
  #
  # - `creating` - The authorization policy is being created.
  #
  # - `updating` - The authorization policy is being updated.
  #
  # - `active` - The authorization policy has been applied to the Client VPN endpoint.
  #
  # - `failed` - The authorization policy could not be applied to the Client VPN endpoint.
  #
  # - `deleting` - The authorization policy is being deleted.
  enum ClientVpnAuthorizationPolicyStatus
    Creating
    Updating
    Active
    Failed
    Deleting

    def self.to_json(e : ClientVpnAuthorizationPolicyStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::ClientVpnAuthorizationPolicyStatus::Creating then "creating"
              when AEC::ClientVpnAuthorizationPolicyStatus::Updating then "updating"
              when AEC::ClientVpnAuthorizationPolicyStatus::Active   then "active"
              when AEC::ClientVpnAuthorizationPolicyStatus::Failed   then "failed"
              when AEC::ClientVpnAuthorizationPolicyStatus::Deleting then "deleting"
              else
                raise Exception.new("unknown enum value for 'ClientVpnAuthorizationPolicyStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ClientVpnAuthorizationPolicyStatus
      value = pull.read_string
      case value
      when "creating" then AEC::ClientVpnAuthorizationPolicyStatus::Creating
      when "updating" then AEC::ClientVpnAuthorizationPolicyStatus::Updating
      when "active"   then AEC::ClientVpnAuthorizationPolicyStatus::Active
      when "failed"   then AEC::ClientVpnAuthorizationPolicyStatus::Failed
      when "deleting" then AEC::ClientVpnAuthorizationPolicyStatus::Deleting
      else
        raise Exception.new("unknown enum value for 'ClientVpnAuthorizationPolicyStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ClientVpnAuthorizationPolicyStatus::Creating then "creating"
      when AEC::ClientVpnAuthorizationPolicyStatus::Updating then "updating"
      when AEC::ClientVpnAuthorizationPolicyStatus::Active   then "active"
      when AEC::ClientVpnAuthorizationPolicyStatus::Failed   then "failed"
      when AEC::ClientVpnAuthorizationPolicyStatus::Deleting then "deleting"
      else
        raise Exception.new("unknown enum value for 'ClientVpnAuthorizationPolicyStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ClientVpnAuthorizationPolicyStatus?
      case key
      when "creating" then AEC::ClientVpnAuthorizationPolicyStatus::Creating
      when "updating" then AEC::ClientVpnAuthorizationPolicyStatus::Updating
      when "active"   then AEC::ClientVpnAuthorizationPolicyStatus::Active
      when "failed"   then AEC::ClientVpnAuthorizationPolicyStatus::Failed
      when "deleting" then AEC::ClientVpnAuthorizationPolicyStatus::Deleting
      else
        nil
      end
    end
  end
end
