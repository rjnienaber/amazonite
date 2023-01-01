private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ExecutionMode
    Auto
    Interactive

    def self.to_json(e : ExecutionMode, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ExecutionMode
      value = pull.read_string
      case value
      when "Auto"        then AS::ExecutionMode::Auto
      when "Interactive" then AS::ExecutionMode::Interactive
      else
        raise Exception.new("unknown enum value for 'ExecutionMode' when deserializing from json: '#{value}'")
      end
    end
  end
end
