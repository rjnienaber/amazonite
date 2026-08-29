private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # The endpoint type. The valid values are `EDGE` for edge-optimized API setup, most suitable for
  # mobile applications; `REGIONAL` for regional API endpoint setup, most suitable for calling from
  # AWS Region; and `PRIVATE` for private APIs.
  enum EndpointType
    Regional
    Edge
    Private

    def self.to_json(e : EndpointType, json : JSON::Builder) : Nil
      value = case e
              when AAG::EndpointType::Regional then "REGIONAL"
              when AAG::EndpointType::Edge     then "EDGE"
              when AAG::EndpointType::Private  then "PRIVATE"
              else
                raise Exception.new("unknown enum value for 'EndpointType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::EndpointType
      value = pull.read_string
      case value
      when "REGIONAL" then AAG::EndpointType::Regional
      when "EDGE"     then AAG::EndpointType::Edge
      when "PRIVATE"  then AAG::EndpointType::Private
      else
        raise Exception.new("unknown enum value for 'EndpointType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::EndpointType::Regional then "REGIONAL"
      when AAG::EndpointType::Edge     then "EDGE"
      when AAG::EndpointType::Private  then "PRIVATE"
      else
        raise Exception.new("unknown enum value for 'EndpointType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::EndpointType?
      case key
      when "REGIONAL" then AAG::EndpointType::Regional
      when "EDGE"     then AAG::EndpointType::Edge
      when "PRIVATE"  then AAG::EndpointType::Private
      else
        nil
      end
    end
  end
end
