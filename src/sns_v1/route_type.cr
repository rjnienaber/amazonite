private alias AS = Amazonite::SnsV1

module Amazonite::SnsV1
  enum RouteType
    Transactional
    Promotional
    Premium

    def self.to_json(e : RouteType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::RouteType
      value = pull.read_string
      case value
      when "Transactional" then AS::RouteType::Transactional
      when "Promotional"   then AS::RouteType::Promotional
      when "Premium"       then AS::RouteType::Premium
      else
        raise Exception.new("unknown enum value for 'RouteType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::RouteType?
      case key
      when "Transactional" then AS::RouteType::Transactional
      when "Promotional"   then AS::RouteType::Promotional
      when "Premium"       then AS::RouteType::Premium
      else
        nil
      end
    end
  end
end
