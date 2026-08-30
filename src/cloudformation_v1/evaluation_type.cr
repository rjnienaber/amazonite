private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum EvaluationType
    Static
    Dynamic

    def self.to_json(e : EvaluationType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::EvaluationType
      value = pull.read_string
      case value
      when "Static"  then ACF::EvaluationType::Static
      when "Dynamic" then ACF::EvaluationType::Dynamic
      else
        raise Exception.new("unknown enum value for 'EvaluationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACF::EvaluationType?
      case key
      when "Static"  then ACF::EvaluationType::Static
      when "Dynamic" then ACF::EvaluationType::Dynamic
      else
        nil
      end
    end
  end
end
