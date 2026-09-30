private alias AS = Amazonite::S3

module Amazonite::S3
  enum Protocol
    Http
    Https

    def self.to_json(e : Protocol, json : JSON::Builder) : Nil
      value = case e
              when AS::Protocol::Http  then "http"
              when AS::Protocol::Https then "https"
              else
                raise Exception.new("unknown enum value for 'Protocol' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::Protocol
      value = pull.read_string
      case value
      when "http"  then AS::Protocol::Http
      when "https" then AS::Protocol::Https
      else
        raise Exception.new("unknown enum value for 'Protocol' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::Protocol::Http  then "http"
      when AS::Protocol::Https then "https"
      else
        raise Exception.new("unknown enum value for 'Protocol' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::Protocol?
      case key
      when "http"  then AS::Protocol::Http
      when "https" then AS::Protocol::Https
      else
        nil
      end
    end
  end
end
