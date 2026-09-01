private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum AccessAdvisorUsageGranularityType
    ServiceLevel
    ActionLevel

    def self.to_json(e : AccessAdvisorUsageGranularityType, json : JSON::Builder) : Nil
      value = case e
              when AI::AccessAdvisorUsageGranularityType::ServiceLevel then "SERVICE_LEVEL"
              when AI::AccessAdvisorUsageGranularityType::ActionLevel  then "ACTION_LEVEL"
              else
                raise Exception.new("unknown enum value for 'AccessAdvisorUsageGranularityType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::AccessAdvisorUsageGranularityType
      value = pull.read_string
      case value
      when "SERVICE_LEVEL" then AI::AccessAdvisorUsageGranularityType::ServiceLevel
      when "ACTION_LEVEL"  then AI::AccessAdvisorUsageGranularityType::ActionLevel
      else
        raise Exception.new("unknown enum value for 'AccessAdvisorUsageGranularityType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::AccessAdvisorUsageGranularityType::ServiceLevel then "SERVICE_LEVEL"
      when AI::AccessAdvisorUsageGranularityType::ActionLevel  then "ACTION_LEVEL"
      else
        raise Exception.new("unknown enum value for 'AccessAdvisorUsageGranularityType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::AccessAdvisorUsageGranularityType?
      case key
      when "SERVICE_LEVEL" then AI::AccessAdvisorUsageGranularityType::ServiceLevel
      when "ACTION_LEVEL"  then AI::AccessAdvisorUsageGranularityType::ActionLevel
      else
        nil
      end
    end
  end
end
