private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  # A JSON Web Signature (JWS) signing algorithm. Valid values are `RS256`, `RS384`, `RS512`,
  # `ES256`, `ES384`, and `ES512`. HMAC (`HS256`, `HS384`, `HS512`) and `none` are not valid values.
  enum JwtSigningAlgorithm
    Rs256
    Rs384
    Rs512
    Es256
    Es384
    Es512

    def self.to_json(e : JwtSigningAlgorithm, json : JSON::Builder) : Nil
      value = case e
              when AAG::JwtSigningAlgorithm::Rs256 then "RS256"
              when AAG::JwtSigningAlgorithm::Rs384 then "RS384"
              when AAG::JwtSigningAlgorithm::Rs512 then "RS512"
              when AAG::JwtSigningAlgorithm::Es256 then "ES256"
              when AAG::JwtSigningAlgorithm::Es384 then "ES384"
              when AAG::JwtSigningAlgorithm::Es512 then "ES512"
              else
                raise Exception.new("unknown enum value for 'JwtSigningAlgorithm' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::JwtSigningAlgorithm
      value = pull.read_string
      case value
      when "RS256" then AAG::JwtSigningAlgorithm::Rs256
      when "RS384" then AAG::JwtSigningAlgorithm::Rs384
      when "RS512" then AAG::JwtSigningAlgorithm::Rs512
      when "ES256" then AAG::JwtSigningAlgorithm::Es256
      when "ES384" then AAG::JwtSigningAlgorithm::Es384
      when "ES512" then AAG::JwtSigningAlgorithm::Es512
      else
        raise Exception.new("unknown enum value for 'JwtSigningAlgorithm' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::JwtSigningAlgorithm::Rs256 then "RS256"
      when AAG::JwtSigningAlgorithm::Rs384 then "RS384"
      when AAG::JwtSigningAlgorithm::Rs512 then "RS512"
      when AAG::JwtSigningAlgorithm::Es256 then "ES256"
      when AAG::JwtSigningAlgorithm::Es384 then "ES384"
      when AAG::JwtSigningAlgorithm::Es512 then "ES512"
      else
        raise Exception.new("unknown enum value for 'JwtSigningAlgorithm' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::JwtSigningAlgorithm?
      case key
      when "RS256" then AAG::JwtSigningAlgorithm::Rs256
      when "RS384" then AAG::JwtSigningAlgorithm::Rs384
      when "RS512" then AAG::JwtSigningAlgorithm::Rs512
      when "ES256" then AAG::JwtSigningAlgorithm::Es256
      when "ES384" then AAG::JwtSigningAlgorithm::Es384
      when "ES512" then AAG::JwtSigningAlgorithm::Es512
      else
        nil
      end
    end
  end
end
