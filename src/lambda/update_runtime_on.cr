private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum UpdateRuntimeOn
    Auto
    Manual
    FunctionUpdate

    def self.to_json(e : UpdateRuntimeOn, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::UpdateRuntimeOn
      value = pull.read_string
      case value
      when "Auto"           then AL::UpdateRuntimeOn::Auto
      when "Manual"         then AL::UpdateRuntimeOn::Manual
      when "FunctionUpdate" then AL::UpdateRuntimeOn::FunctionUpdate
      else
        raise Exception.new("unknown enum value for 'UpdateRuntimeOn' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::UpdateRuntimeOn?
      case key
      when "Auto"           then AL::UpdateRuntimeOn::Auto
      when "Manual"         then AL::UpdateRuntimeOn::Manual
      when "FunctionUpdate" then AL::UpdateRuntimeOn::FunctionUpdate
      else
        nil
      end
    end
  end
end
