private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ComplianceSeverity
    Critical
    High
    Medium
    Low
    Informational
    Unspecified

    def self.to_json(e : ComplianceSeverity, json : JSON::Builder) : Nil
      value = case e
              when AS::ComplianceSeverity::Critical      then "CRITICAL"
              when AS::ComplianceSeverity::High          then "HIGH"
              when AS::ComplianceSeverity::Medium        then "MEDIUM"
              when AS::ComplianceSeverity::Low           then "LOW"
              when AS::ComplianceSeverity::Informational then "INFORMATIONAL"
              when AS::ComplianceSeverity::Unspecified   then "UNSPECIFIED"
              else
                raise Exception.new("unknown enum value for 'ComplianceSeverity' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ComplianceSeverity
      value = pull.read_string
      case value
      when "CRITICAL"      then AS::ComplianceSeverity::Critical
      when "HIGH"          then AS::ComplianceSeverity::High
      when "MEDIUM"        then AS::ComplianceSeverity::Medium
      when "LOW"           then AS::ComplianceSeverity::Low
      when "INFORMATIONAL" then AS::ComplianceSeverity::Informational
      when "UNSPECIFIED"   then AS::ComplianceSeverity::Unspecified
      else
        raise Exception.new("unknown enum value for 'ComplianceSeverity' when deserializing from json: '#{value}'")
      end
    end
  end
end
