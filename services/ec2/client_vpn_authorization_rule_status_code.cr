private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ClientVpnAuthorizationRuleStatusCode
    Authorizing
    Active
    Failed
    Revoking

    def self.to_json(e : ClientVpnAuthorizationRuleStatusCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::ClientVpnAuthorizationRuleStatusCode::Authorizing then "authorizing"
              when AEC::ClientVpnAuthorizationRuleStatusCode::Active      then "active"
              when AEC::ClientVpnAuthorizationRuleStatusCode::Failed      then "failed"
              when AEC::ClientVpnAuthorizationRuleStatusCode::Revoking    then "revoking"
              else
                raise Exception.new("unknown enum value for 'ClientVpnAuthorizationRuleStatusCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ClientVpnAuthorizationRuleStatusCode
      value = pull.read_string
      case value
      when "authorizing" then AEC::ClientVpnAuthorizationRuleStatusCode::Authorizing
      when "active"      then AEC::ClientVpnAuthorizationRuleStatusCode::Active
      when "failed"      then AEC::ClientVpnAuthorizationRuleStatusCode::Failed
      when "revoking"    then AEC::ClientVpnAuthorizationRuleStatusCode::Revoking
      else
        raise Exception.new("unknown enum value for 'ClientVpnAuthorizationRuleStatusCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ClientVpnAuthorizationRuleStatusCode::Authorizing then "authorizing"
      when AEC::ClientVpnAuthorizationRuleStatusCode::Active      then "active"
      when AEC::ClientVpnAuthorizationRuleStatusCode::Failed      then "failed"
      when AEC::ClientVpnAuthorizationRuleStatusCode::Revoking    then "revoking"
      else
        raise Exception.new("unknown enum value for 'ClientVpnAuthorizationRuleStatusCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ClientVpnAuthorizationRuleStatusCode?
      case key
      when "authorizing" then AEC::ClientVpnAuthorizationRuleStatusCode::Authorizing
      when "active"      then AEC::ClientVpnAuthorizationRuleStatusCode::Active
      when "failed"      then AEC::ClientVpnAuthorizationRuleStatusCode::Failed
      when "revoking"    then AEC::ClientVpnAuthorizationRuleStatusCode::Revoking
      else
        nil
      end
    end
  end
end
