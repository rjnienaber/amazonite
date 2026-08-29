private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum RequiresRecreation
    Never
    Conditionally
    Always

    def self.to_json(e : RequiresRecreation, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::RequiresRecreation
      value = pull.read_string
      case value
      when "Never"         then ACF::RequiresRecreation::Never
      when "Conditionally" then ACF::RequiresRecreation::Conditionally
      when "Always"        then ACF::RequiresRecreation::Always
      else
        raise Exception.new("unknown enum value for 'RequiresRecreation' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACF::RequiresRecreation?
      case key
      when "Never"         then ACF::RequiresRecreation::Never
      when "Conditionally" then ACF::RequiresRecreation::Conditionally
      when "Always"        then ACF::RequiresRecreation::Always
      else
        nil
      end
    end
  end
end
