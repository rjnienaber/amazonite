private alias AS = Amazonite::S3

module Amazonite::S3
  enum AnnotationConfigurationState
    Enabled
    Disabled

    def self.to_json(e : AnnotationConfigurationState, json : JSON::Builder) : Nil
      value = case e
              when AS::AnnotationConfigurationState::Enabled  then "ENABLED"
              when AS::AnnotationConfigurationState::Disabled then "DISABLED"
              else
                raise Exception.new("unknown enum value for 'AnnotationConfigurationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AnnotationConfigurationState
      value = pull.read_string
      case value
      when "ENABLED"  then AS::AnnotationConfigurationState::Enabled
      when "DISABLED" then AS::AnnotationConfigurationState::Disabled
      else
        raise Exception.new("unknown enum value for 'AnnotationConfigurationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::AnnotationConfigurationState::Enabled  then "ENABLED"
      when AS::AnnotationConfigurationState::Disabled then "DISABLED"
      else
        raise Exception.new("unknown enum value for 'AnnotationConfigurationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::AnnotationConfigurationState?
      case key
      when "ENABLED"  then AS::AnnotationConfigurationState::Enabled
      when "DISABLED" then AS::AnnotationConfigurationState::Disabled
      else
        nil
      end
    end
  end
end
