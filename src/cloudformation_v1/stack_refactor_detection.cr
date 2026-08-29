private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum StackRefactorDetection
    Auto
    Manual

    def self.to_json(e : StackRefactorDetection, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackRefactorDetection::Auto   then "AUTO"
              when ACF::StackRefactorDetection::Manual then "MANUAL"
              else
                raise Exception.new("unknown enum value for 'StackRefactorDetection' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackRefactorDetection
      value = pull.read_string
      case value
      when "AUTO"   then ACF::StackRefactorDetection::Auto
      when "MANUAL" then ACF::StackRefactorDetection::Manual
      else
        raise Exception.new("unknown enum value for 'StackRefactorDetection' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackRefactorDetection::Auto   then "AUTO"
      when ACF::StackRefactorDetection::Manual then "MANUAL"
      else
        raise Exception.new("unknown enum value for 'StackRefactorDetection' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackRefactorDetection?
      case key
      when "AUTO"   then ACF::StackRefactorDetection::Auto
      when "MANUAL" then ACF::StackRefactorDetection::Manual
      else
        nil
      end
    end
  end
end
