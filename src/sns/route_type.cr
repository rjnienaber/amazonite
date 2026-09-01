private alias AS = Amazonite::Sns

module Amazonite::Sns
  # Enum listing out all supported route types. The following enum values are supported. 1.
  # Transactional : Non-marketing traffic 2. Promotional : Marketing 3. Premium : Premium routes for
  # OTP delivery to the carriers
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
