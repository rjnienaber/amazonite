private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum AnnotationSeverityLevel
    Informational
    Low
    Medium
    High
    Critical

    def self.to_json(e : AnnotationSeverityLevel, json : JSON::Builder) : Nil
      value = case e
              when ACF::AnnotationSeverityLevel::Informational then "INFORMATIONAL"
              when ACF::AnnotationSeverityLevel::Low           then "LOW"
              when ACF::AnnotationSeverityLevel::Medium        then "MEDIUM"
              when ACF::AnnotationSeverityLevel::High          then "HIGH"
              when ACF::AnnotationSeverityLevel::Critical      then "CRITICAL"
              else
                raise Exception.new("unknown enum value for 'AnnotationSeverityLevel' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::AnnotationSeverityLevel
      value = pull.read_string
      case value
      when "INFORMATIONAL" then ACF::AnnotationSeverityLevel::Informational
      when "LOW"           then ACF::AnnotationSeverityLevel::Low
      when "MEDIUM"        then ACF::AnnotationSeverityLevel::Medium
      when "HIGH"          then ACF::AnnotationSeverityLevel::High
      when "CRITICAL"      then ACF::AnnotationSeverityLevel::Critical
      else
        raise Exception.new("unknown enum value for 'AnnotationSeverityLevel' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::AnnotationSeverityLevel::Informational then "INFORMATIONAL"
      when ACF::AnnotationSeverityLevel::Low           then "LOW"
      when ACF::AnnotationSeverityLevel::Medium        then "MEDIUM"
      when ACF::AnnotationSeverityLevel::High          then "HIGH"
      when ACF::AnnotationSeverityLevel::Critical      then "CRITICAL"
      else
        raise Exception.new("unknown enum value for 'AnnotationSeverityLevel' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::AnnotationSeverityLevel?
      case key
      when "INFORMATIONAL" then ACF::AnnotationSeverityLevel::Informational
      when "LOW"           then ACF::AnnotationSeverityLevel::Low
      when "MEDIUM"        then ACF::AnnotationSeverityLevel::Medium
      when "HIGH"          then ACF::AnnotationSeverityLevel::High
      when "CRITICAL"      then ACF::AnnotationSeverityLevel::Critical
      else
        nil
      end
    end
  end
end
