private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum CodeSigningPolicy
    Warn
    Enforce

    def self.to_json(e : CodeSigningPolicy, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::CodeSigningPolicy
      value = pull.read_string
      case value
      when "Warn"    then AL::CodeSigningPolicy::Warn
      when "Enforce" then AL::CodeSigningPolicy::Enforce
      else
        raise Exception.new("unknown enum value for 'CodeSigningPolicy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::CodeSigningPolicy?
      case key
      when "Warn"    then AL::CodeSigningPolicy::Warn
      when "Enforce" then AL::CodeSigningPolicy::Enforce
      else
        nil
      end
    end
  end
end
