private alias ACW = Amazonite::CloudWatch

module Amazonite::CloudWatch
  enum StatusCode
    Complete
    InternalError
    PartialData
    Forbidden

    def self.to_json(e : StatusCode, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::StatusCode
      value = pull.read_string
      case value
      when "Complete"      then ACW::StatusCode::Complete
      when "InternalError" then ACW::StatusCode::InternalError
      when "PartialData"   then ACW::StatusCode::PartialData
      when "Forbidden"     then ACW::StatusCode::Forbidden
      else
        raise Exception.new("unknown enum value for 'StatusCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACW::StatusCode?
      case key
      when "Complete"      then ACW::StatusCode::Complete
      when "InternalError" then ACW::StatusCode::InternalError
      when "PartialData"   then ACW::StatusCode::PartialData
      when "Forbidden"     then ACW::StatusCode::Forbidden
      else
        nil
      end
    end
  end
end
