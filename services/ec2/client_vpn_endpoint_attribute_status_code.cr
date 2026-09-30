private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ClientVpnEndpointAttributeStatusCode
    Applying
    Applied

    def self.to_json(e : ClientVpnEndpointAttributeStatusCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::ClientVpnEndpointAttributeStatusCode::Applying then "applying"
              when AEC::ClientVpnEndpointAttributeStatusCode::Applied  then "applied"
              else
                raise Exception.new("unknown enum value for 'ClientVpnEndpointAttributeStatusCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ClientVpnEndpointAttributeStatusCode
      value = pull.read_string
      case value
      when "applying" then AEC::ClientVpnEndpointAttributeStatusCode::Applying
      when "applied"  then AEC::ClientVpnEndpointAttributeStatusCode::Applied
      else
        raise Exception.new("unknown enum value for 'ClientVpnEndpointAttributeStatusCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ClientVpnEndpointAttributeStatusCode::Applying then "applying"
      when AEC::ClientVpnEndpointAttributeStatusCode::Applied  then "applied"
      else
        raise Exception.new("unknown enum value for 'ClientVpnEndpointAttributeStatusCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ClientVpnEndpointAttributeStatusCode?
      case key
      when "applying" then AEC::ClientVpnEndpointAttributeStatusCode::Applying
      when "applied"  then AEC::ClientVpnEndpointAttributeStatusCode::Applied
      else
        nil
      end
    end
  end
end
