private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum PatchComplianceLevel
    Critical
    High
    Medium
    Low
    Informational
    Unspecified

    def self.to_json(e : PatchComplianceLevel, json : JSON::Builder) : Nil
      value = case e
              when AS::PatchComplianceLevel::Critical      then "CRITICAL"
              when AS::PatchComplianceLevel::High          then "HIGH"
              when AS::PatchComplianceLevel::Medium        then "MEDIUM"
              when AS::PatchComplianceLevel::Low           then "LOW"
              when AS::PatchComplianceLevel::Informational then "INFORMATIONAL"
              when AS::PatchComplianceLevel::Unspecified   then "UNSPECIFIED"
              else
                raise Exception.new("unknown enum value for 'PatchComplianceLevel' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::PatchComplianceLevel
      value = pull.read_string
      case value
      when "CRITICAL"      then AS::PatchComplianceLevel::Critical
      when "HIGH"          then AS::PatchComplianceLevel::High
      when "MEDIUM"        then AS::PatchComplianceLevel::Medium
      when "LOW"           then AS::PatchComplianceLevel::Low
      when "INFORMATIONAL" then AS::PatchComplianceLevel::Informational
      when "UNSPECIFIED"   then AS::PatchComplianceLevel::Unspecified
      else
        raise Exception.new("unknown enum value for 'PatchComplianceLevel' when deserializing from json: '#{value}'")
      end
    end
  end
end
