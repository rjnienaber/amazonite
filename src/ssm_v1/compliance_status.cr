private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ComplianceStatus
    Compliant
    NonCompliant

    def self.to_json(e : ComplianceStatus, json : JSON::Builder) : Nil
      value = case e
              when AS::ComplianceStatus::Compliant    then "COMPLIANT"
              when AS::ComplianceStatus::NonCompliant then "NON_COMPLIANT"
              else
                raise Exception.new("unknown enum value for 'ComplianceStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ComplianceStatus
      value = pull.read_string
      case value
      when "COMPLIANT"     then AS::ComplianceStatus::Compliant
      when "NON_COMPLIANT" then AS::ComplianceStatus::NonCompliant
      else
        raise Exception.new("unknown enum value for 'ComplianceStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
