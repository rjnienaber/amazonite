private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum ValidationStatus
    Failed
    Skipped

    def self.to_json(e : ValidationStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::ValidationStatus::Failed  then "FAILED"
              when ACF::ValidationStatus::Skipped then "SKIPPED"
              else
                raise Exception.new("unknown enum value for 'ValidationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ValidationStatus
      value = pull.read_string
      case value
      when "FAILED"  then ACF::ValidationStatus::Failed
      when "SKIPPED" then ACF::ValidationStatus::Skipped
      else
        raise Exception.new("unknown enum value for 'ValidationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::ValidationStatus::Failed  then "FAILED"
      when ACF::ValidationStatus::Skipped then "SKIPPED"
      else
        raise Exception.new("unknown enum value for 'ValidationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::ValidationStatus?
      case key
      when "FAILED"  then ACF::ValidationStatus::Failed
      when "SKIPPED" then ACF::ValidationStatus::Skipped
      else
        nil
      end
    end
  end
end
