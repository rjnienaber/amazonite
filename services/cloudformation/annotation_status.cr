private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum AnnotationStatus
    Passed
    Failed
    Skipped

    def self.to_json(e : AnnotationStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::AnnotationStatus::Passed  then "PASSED"
              when ACF::AnnotationStatus::Failed  then "FAILED"
              when ACF::AnnotationStatus::Skipped then "SKIPPED"
              else
                raise Exception.new("unknown enum value for 'AnnotationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::AnnotationStatus
      value = pull.read_string
      case value
      when "PASSED"  then ACF::AnnotationStatus::Passed
      when "FAILED"  then ACF::AnnotationStatus::Failed
      when "SKIPPED" then ACF::AnnotationStatus::Skipped
      else
        raise Exception.new("unknown enum value for 'AnnotationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::AnnotationStatus::Passed  then "PASSED"
      when ACF::AnnotationStatus::Failed  then "FAILED"
      when ACF::AnnotationStatus::Skipped then "SKIPPED"
      else
        raise Exception.new("unknown enum value for 'AnnotationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::AnnotationStatus?
      case key
      when "PASSED"  then ACF::AnnotationStatus::Passed
      when "FAILED"  then ACF::AnnotationStatus::Failed
      when "SKIPPED" then ACF::AnnotationStatus::Skipped
      else
        nil
      end
    end
  end
end
