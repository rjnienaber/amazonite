private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum GlobalEndpointTokenVersion
    V1Token
    V2Token

    def self.to_json(e : GlobalEndpointTokenVersion, json : JSON::Builder) : Nil
      value = case e
              when AI::GlobalEndpointTokenVersion::V1Token then "v1Token"
              when AI::GlobalEndpointTokenVersion::V2Token then "v2Token"
              else
                raise Exception.new("unknown enum value for 'GlobalEndpointTokenVersion' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::GlobalEndpointTokenVersion
      value = pull.read_string
      case value
      when "v1Token" then AI::GlobalEndpointTokenVersion::V1Token
      when "v2Token" then AI::GlobalEndpointTokenVersion::V2Token
      else
        raise Exception.new("unknown enum value for 'GlobalEndpointTokenVersion' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::GlobalEndpointTokenVersion::V1Token then "v1Token"
      when AI::GlobalEndpointTokenVersion::V2Token then "v2Token"
      else
        raise Exception.new("unknown enum value for 'GlobalEndpointTokenVersion' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::GlobalEndpointTokenVersion?
      case key
      when "v1Token" then AI::GlobalEndpointTokenVersion::V1Token
      when "v2Token" then AI::GlobalEndpointTokenVersion::V2Token
      else
        nil
      end
    end
  end
end
