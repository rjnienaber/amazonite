private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum Replacement
    True
    False
    Conditional

    def self.to_json(e : Replacement, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::Replacement
      value = pull.read_string
      case value
      when "True"        then ACF::Replacement::True
      when "False"       then ACF::Replacement::False
      when "Conditional" then ACF::Replacement::Conditional
      else
        raise Exception.new("unknown enum value for 'Replacement' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACF::Replacement?
      case key
      when "True"        then ACF::Replacement::True
      when "False"       then ACF::Replacement::False
      when "Conditional" then ACF::Replacement::Conditional
      else
        nil
      end
    end
  end
end
