private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VerifiedAccessEndpointProtocol
    Http
    Https
    Tcp

    def self.to_json(e : VerifiedAccessEndpointProtocol, json : JSON::Builder) : Nil
      value = case e
              when AEC::VerifiedAccessEndpointProtocol::Http  then "http"
              when AEC::VerifiedAccessEndpointProtocol::Https then "https"
              when AEC::VerifiedAccessEndpointProtocol::Tcp   then "tcp"
              else
                raise Exception.new("unknown enum value for 'VerifiedAccessEndpointProtocol' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VerifiedAccessEndpointProtocol
      value = pull.read_string
      case value
      when "http"  then AEC::VerifiedAccessEndpointProtocol::Http
      when "https" then AEC::VerifiedAccessEndpointProtocol::Https
      when "tcp"   then AEC::VerifiedAccessEndpointProtocol::Tcp
      else
        raise Exception.new("unknown enum value for 'VerifiedAccessEndpointProtocol' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VerifiedAccessEndpointProtocol::Http  then "http"
      when AEC::VerifiedAccessEndpointProtocol::Https then "https"
      when AEC::VerifiedAccessEndpointProtocol::Tcp   then "tcp"
      else
        raise Exception.new("unknown enum value for 'VerifiedAccessEndpointProtocol' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VerifiedAccessEndpointProtocol?
      case key
      when "http"  then AEC::VerifiedAccessEndpointProtocol::Http
      when "https" then AEC::VerifiedAccessEndpointProtocol::Https
      when "tcp"   then AEC::VerifiedAccessEndpointProtocol::Tcp
      else
        nil
      end
    end
  end
end
