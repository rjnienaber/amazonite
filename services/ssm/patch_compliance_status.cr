private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum PatchComplianceStatus
    Compliant
    NonCompliant

    def self.to_json(e : PatchComplianceStatus, json : JSON::Builder) : Nil
      value = case e
              when AS::PatchComplianceStatus::Compliant    then "COMPLIANT"
              when AS::PatchComplianceStatus::NonCompliant then "NON_COMPLIANT"
              else
                raise Exception.new("unknown enum value for 'PatchComplianceStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::PatchComplianceStatus
      value = pull.read_string
      case value
      when "COMPLIANT"     then AS::PatchComplianceStatus::Compliant
      when "NON_COMPLIANT" then AS::PatchComplianceStatus::NonCompliant
      else
        raise Exception.new("unknown enum value for 'PatchComplianceStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::PatchComplianceStatus::Compliant    then "COMPLIANT"
      when AS::PatchComplianceStatus::NonCompliant then "NON_COMPLIANT"
      else
        raise Exception.new("unknown enum value for 'PatchComplianceStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::PatchComplianceStatus?
      case key
      when "COMPLIANT"     then AS::PatchComplianceStatus::Compliant
      when "NON_COMPLIANT" then AS::PatchComplianceStatus::NonCompliant
      else
        nil
      end
    end
  end
end
