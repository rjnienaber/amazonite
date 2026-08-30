private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  enum LocationStatusType
    Documented
    Undocumented

    def self.to_json(e : LocationStatusType, json : JSON::Builder) : Nil
      value = case e
              when AAG::LocationStatusType::Documented   then "DOCUMENTED"
              when AAG::LocationStatusType::Undocumented then "UNDOCUMENTED"
              else
                raise Exception.new("unknown enum value for 'LocationStatusType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::LocationStatusType
      value = pull.read_string
      case value
      when "DOCUMENTED"   then AAG::LocationStatusType::Documented
      when "UNDOCUMENTED" then AAG::LocationStatusType::Undocumented
      else
        raise Exception.new("unknown enum value for 'LocationStatusType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::LocationStatusType::Documented   then "DOCUMENTED"
      when AAG::LocationStatusType::Undocumented then "UNDOCUMENTED"
      else
        raise Exception.new("unknown enum value for 'LocationStatusType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::LocationStatusType?
      case key
      when "DOCUMENTED"   then AAG::LocationStatusType::Documented
      when "UNDOCUMENTED" then AAG::LocationStatusType::Undocumented
      else
        nil
      end
    end
  end
end
