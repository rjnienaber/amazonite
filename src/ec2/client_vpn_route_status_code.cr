private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ClientVpnRouteStatusCode
    Creating
    Active
    Failed
    Deleting

    def self.to_json(e : ClientVpnRouteStatusCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::ClientVpnRouteStatusCode::Creating then "creating"
              when AEC::ClientVpnRouteStatusCode::Active   then "active"
              when AEC::ClientVpnRouteStatusCode::Failed   then "failed"
              when AEC::ClientVpnRouteStatusCode::Deleting then "deleting"
              else
                raise Exception.new("unknown enum value for 'ClientVpnRouteStatusCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ClientVpnRouteStatusCode
      value = pull.read_string
      case value
      when "creating" then AEC::ClientVpnRouteStatusCode::Creating
      when "active"   then AEC::ClientVpnRouteStatusCode::Active
      when "failed"   then AEC::ClientVpnRouteStatusCode::Failed
      when "deleting" then AEC::ClientVpnRouteStatusCode::Deleting
      else
        raise Exception.new("unknown enum value for 'ClientVpnRouteStatusCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ClientVpnRouteStatusCode::Creating then "creating"
      when AEC::ClientVpnRouteStatusCode::Active   then "active"
      when AEC::ClientVpnRouteStatusCode::Failed   then "failed"
      when AEC::ClientVpnRouteStatusCode::Deleting then "deleting"
      else
        raise Exception.new("unknown enum value for 'ClientVpnRouteStatusCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ClientVpnRouteStatusCode?
      case key
      when "creating" then AEC::ClientVpnRouteStatusCode::Creating
      when "active"   then AEC::ClientVpnRouteStatusCode::Active
      when "failed"   then AEC::ClientVpnRouteStatusCode::Failed
      when "deleting" then AEC::ClientVpnRouteStatusCode::Deleting
      else
        nil
      end
    end
  end
end
