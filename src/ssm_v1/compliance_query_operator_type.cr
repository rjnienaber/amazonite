private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ComplianceQueryOperatorType
    Equal
    NotEqual
    BeginWith
    LessThan
    GreaterThan

    def self.to_json(e : ComplianceQueryOperatorType, json : JSON::Builder) : Nil
      value = case e
              when AS::ComplianceQueryOperatorType::Equal       then "EQUAL"
              when AS::ComplianceQueryOperatorType::NotEqual    then "NOT_EQUAL"
              when AS::ComplianceQueryOperatorType::BeginWith   then "BEGIN_WITH"
              when AS::ComplianceQueryOperatorType::LessThan    then "LESS_THAN"
              when AS::ComplianceQueryOperatorType::GreaterThan then "GREATER_THAN"
              else
                raise Exception.new("unknown enum value for 'ComplianceQueryOperatorType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ComplianceQueryOperatorType
      value = pull.read_string
      case value
      when "EQUAL"        then AS::ComplianceQueryOperatorType::Equal
      when "NOT_EQUAL"    then AS::ComplianceQueryOperatorType::NotEqual
      when "BEGIN_WITH"   then AS::ComplianceQueryOperatorType::BeginWith
      when "LESS_THAN"    then AS::ComplianceQueryOperatorType::LessThan
      when "GREATER_THAN" then AS::ComplianceQueryOperatorType::GreaterThan
      else
        raise Exception.new("unknown enum value for 'ComplianceQueryOperatorType' when deserializing from json: '#{value}'")
      end
    end
  end
end
