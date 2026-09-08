private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamComplianceStatus
    Compliant
    Noncompliant
    Unmanaged
    Ignored

    def self.to_json(e : IpamComplianceStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamComplianceStatus::Compliant    then "compliant"
              when AEC::IpamComplianceStatus::Noncompliant then "noncompliant"
              when AEC::IpamComplianceStatus::Unmanaged    then "unmanaged"
              when AEC::IpamComplianceStatus::Ignored      then "ignored"
              else
                raise Exception.new("unknown enum value for 'IpamComplianceStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamComplianceStatus
      value = pull.read_string
      case value
      when "compliant"    then AEC::IpamComplianceStatus::Compliant
      when "noncompliant" then AEC::IpamComplianceStatus::Noncompliant
      when "unmanaged"    then AEC::IpamComplianceStatus::Unmanaged
      when "ignored"      then AEC::IpamComplianceStatus::Ignored
      else
        raise Exception.new("unknown enum value for 'IpamComplianceStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamComplianceStatus::Compliant    then "compliant"
      when AEC::IpamComplianceStatus::Noncompliant then "noncompliant"
      when AEC::IpamComplianceStatus::Unmanaged    then "unmanaged"
      when AEC::IpamComplianceStatus::Ignored      then "ignored"
      else
        raise Exception.new("unknown enum value for 'IpamComplianceStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamComplianceStatus?
      case key
      when "compliant"    then AEC::IpamComplianceStatus::Compliant
      when "noncompliant" then AEC::IpamComplianceStatus::Noncompliant
      when "unmanaged"    then AEC::IpamComplianceStatus::Unmanaged
      when "ignored"      then AEC::IpamComplianceStatus::Ignored
      else
        nil
      end
    end
  end
end
