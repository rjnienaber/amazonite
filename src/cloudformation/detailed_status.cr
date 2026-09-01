private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum DetailedStatus
    ConfigurationComplete
    ValidationFailed

    def self.to_json(e : DetailedStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::DetailedStatus::ConfigurationComplete then "CONFIGURATION_COMPLETE"
              when ACF::DetailedStatus::ValidationFailed      then "VALIDATION_FAILED"
              else
                raise Exception.new("unknown enum value for 'DetailedStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::DetailedStatus
      value = pull.read_string
      case value
      when "CONFIGURATION_COMPLETE" then ACF::DetailedStatus::ConfigurationComplete
      when "VALIDATION_FAILED"      then ACF::DetailedStatus::ValidationFailed
      else
        raise Exception.new("unknown enum value for 'DetailedStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::DetailedStatus::ConfigurationComplete then "CONFIGURATION_COMPLETE"
      when ACF::DetailedStatus::ValidationFailed      then "VALIDATION_FAILED"
      else
        raise Exception.new("unknown enum value for 'DetailedStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::DetailedStatus?
      case key
      when "CONFIGURATION_COMPLETE" then ACF::DetailedStatus::ConfigurationComplete
      when "VALIDATION_FAILED"      then ACF::DetailedStatus::ValidationFailed
      else
        nil
      end
    end
  end
end
