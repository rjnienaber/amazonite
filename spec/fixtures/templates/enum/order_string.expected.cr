private alias AADS = Amazonite::ApplicationDiscoveryServiceV2

module Amazonite::ApplicationDiscoveryServiceV2
  enum OrderString
    Asc
    Desc

    def self.to_json(e : OrderString, json : JSON::Builder) : Nil
      value = case e
              when AADS::OrderString::Asc  then "ASC"
              when AADS::OrderString::Desc then "DESC"
              else
                raise Exception.new("unknown enum value for 'OrderString' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AADS::OrderString
      value = pull.read_string
      case value
      when "ASC"  then AADS::OrderString::Asc
      when "DESC" then AADS::OrderString::Desc
      else
        raise Exception.new("unknown enum value for 'OrderString' when deserializing from json: '#{value}'")
      end
    end
  end
end
