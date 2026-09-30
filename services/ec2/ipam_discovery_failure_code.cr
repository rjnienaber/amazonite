private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamDiscoveryFailureCode
    AssumeRoleFailure
    ThrottlingFailure
    UnauthorizedFailure

    def self.to_json(e : IpamDiscoveryFailureCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamDiscoveryFailureCode::AssumeRoleFailure   then "assume-role-failure"
              when AEC::IpamDiscoveryFailureCode::ThrottlingFailure   then "throttling-failure"
              when AEC::IpamDiscoveryFailureCode::UnauthorizedFailure then "unauthorized-failure"
              else
                raise Exception.new("unknown enum value for 'IpamDiscoveryFailureCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamDiscoveryFailureCode
      value = pull.read_string
      case value
      when "assume-role-failure"  then AEC::IpamDiscoveryFailureCode::AssumeRoleFailure
      when "throttling-failure"   then AEC::IpamDiscoveryFailureCode::ThrottlingFailure
      when "unauthorized-failure" then AEC::IpamDiscoveryFailureCode::UnauthorizedFailure
      else
        raise Exception.new("unknown enum value for 'IpamDiscoveryFailureCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamDiscoveryFailureCode::AssumeRoleFailure   then "assume-role-failure"
      when AEC::IpamDiscoveryFailureCode::ThrottlingFailure   then "throttling-failure"
      when AEC::IpamDiscoveryFailureCode::UnauthorizedFailure then "unauthorized-failure"
      else
        raise Exception.new("unknown enum value for 'IpamDiscoveryFailureCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamDiscoveryFailureCode?
      case key
      when "assume-role-failure"  then AEC::IpamDiscoveryFailureCode::AssumeRoleFailure
      when "throttling-failure"   then AEC::IpamDiscoveryFailureCode::ThrottlingFailure
      when "unauthorized-failure" then AEC::IpamDiscoveryFailureCode::UnauthorizedFailure
      else
        nil
      end
    end
  end
end
