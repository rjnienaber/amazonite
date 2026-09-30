private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamManagementState
    Managed
    Unmanaged
    Ignored

    def self.to_json(e : IpamManagementState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamManagementState::Managed   then "managed"
              when AEC::IpamManagementState::Unmanaged then "unmanaged"
              when AEC::IpamManagementState::Ignored   then "ignored"
              else
                raise Exception.new("unknown enum value for 'IpamManagementState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamManagementState
      value = pull.read_string
      case value
      when "managed"   then AEC::IpamManagementState::Managed
      when "unmanaged" then AEC::IpamManagementState::Unmanaged
      when "ignored"   then AEC::IpamManagementState::Ignored
      else
        raise Exception.new("unknown enum value for 'IpamManagementState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamManagementState::Managed   then "managed"
      when AEC::IpamManagementState::Unmanaged then "unmanaged"
      when AEC::IpamManagementState::Ignored   then "ignored"
      else
        raise Exception.new("unknown enum value for 'IpamManagementState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamManagementState?
      case key
      when "managed"   then AEC::IpamManagementState::Managed
      when "unmanaged" then AEC::IpamManagementState::Unmanaged
      when "ignored"   then AEC::IpamManagementState::Ignored
      else
        nil
      end
    end
  end
end
