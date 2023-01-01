private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum AssociationComplianceSeverity
    Critical
    High
    Medium
    Low
    Unspecified

    def self.to_json(e : AssociationComplianceSeverity, json : JSON::Builder) : Nil
      value = case e
              when AS::AssociationComplianceSeverity::Critical    then "CRITICAL"
              when AS::AssociationComplianceSeverity::High        then "HIGH"
              when AS::AssociationComplianceSeverity::Medium      then "MEDIUM"
              when AS::AssociationComplianceSeverity::Low         then "LOW"
              when AS::AssociationComplianceSeverity::Unspecified then "UNSPECIFIED"
              else
                raise Exception.new("unknown enum value for 'AssociationComplianceSeverity' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AssociationComplianceSeverity
      value = pull.read_string
      case value
      when "CRITICAL"    then AS::AssociationComplianceSeverity::Critical
      when "HIGH"        then AS::AssociationComplianceSeverity::High
      when "MEDIUM"      then AS::AssociationComplianceSeverity::Medium
      when "LOW"         then AS::AssociationComplianceSeverity::Low
      when "UNSPECIFIED" then AS::AssociationComplianceSeverity::Unspecified
      else
        raise Exception.new("unknown enum value for 'AssociationComplianceSeverity' when deserializing from json: '#{value}'")
      end
    end
  end
end
