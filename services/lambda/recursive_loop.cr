private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum RecursiveLoop
    Allow
    Terminate

    def self.to_json(e : RecursiveLoop, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::RecursiveLoop
      value = pull.read_string
      case value
      when "Allow"     then AL::RecursiveLoop::Allow
      when "Terminate" then AL::RecursiveLoop::Terminate
      else
        raise Exception.new("unknown enum value for 'RecursiveLoop' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::RecursiveLoop?
      case key
      when "Allow"     then AL::RecursiveLoop::Allow
      when "Terminate" then AL::RecursiveLoop::Terminate
      else
        nil
      end
    end
  end
end
