private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NetworkInterfacePermissionStateCode
    Pending
    Granted
    Revoking
    Revoked

    def self.to_json(e : NetworkInterfacePermissionStateCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::NetworkInterfacePermissionStateCode::Pending  then "pending"
              when AEC::NetworkInterfacePermissionStateCode::Granted  then "granted"
              when AEC::NetworkInterfacePermissionStateCode::Revoking then "revoking"
              when AEC::NetworkInterfacePermissionStateCode::Revoked  then "revoked"
              else
                raise Exception.new("unknown enum value for 'NetworkInterfacePermissionStateCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NetworkInterfacePermissionStateCode
      value = pull.read_string
      case value
      when "pending"  then AEC::NetworkInterfacePermissionStateCode::Pending
      when "granted"  then AEC::NetworkInterfacePermissionStateCode::Granted
      when "revoking" then AEC::NetworkInterfacePermissionStateCode::Revoking
      when "revoked"  then AEC::NetworkInterfacePermissionStateCode::Revoked
      else
        raise Exception.new("unknown enum value for 'NetworkInterfacePermissionStateCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NetworkInterfacePermissionStateCode::Pending  then "pending"
      when AEC::NetworkInterfacePermissionStateCode::Granted  then "granted"
      when AEC::NetworkInterfacePermissionStateCode::Revoking then "revoking"
      when AEC::NetworkInterfacePermissionStateCode::Revoked  then "revoked"
      else
        raise Exception.new("unknown enum value for 'NetworkInterfacePermissionStateCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NetworkInterfacePermissionStateCode?
      case key
      when "pending"  then AEC::NetworkInterfacePermissionStateCode::Pending
      when "granted"  then AEC::NetworkInterfacePermissionStateCode::Granted
      when "revoking" then AEC::NetworkInterfacePermissionStateCode::Revoking
      when "revoked"  then AEC::NetworkInterfacePermissionStateCode::Revoked
      else
        nil
      end
    end
  end
end
