private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum TracingMode
    Active
    PassThrough

    def self.to_json(e : TracingMode, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::TracingMode
      value = pull.read_string
      case value
      when "Active"      then AL::TracingMode::Active
      when "PassThrough" then AL::TracingMode::PassThrough
      else
        raise Exception.new("unknown enum value for 'TracingMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::TracingMode?
      case key
      when "Active"      then AL::TracingMode::Active
      when "PassThrough" then AL::TracingMode::PassThrough
      else
        nil
      end
    end
  end
end
