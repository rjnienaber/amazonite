private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TokenState
    Valid
    Expired

    def self.to_json(e : TokenState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TokenState::Valid   then "valid"
              when AEC::TokenState::Expired then "expired"
              else
                raise Exception.new("unknown enum value for 'TokenState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TokenState
      value = pull.read_string
      case value
      when "valid"   then AEC::TokenState::Valid
      when "expired" then AEC::TokenState::Expired
      else
        raise Exception.new("unknown enum value for 'TokenState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TokenState::Valid   then "valid"
      when AEC::TokenState::Expired then "expired"
      else
        raise Exception.new("unknown enum value for 'TokenState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TokenState?
      case key
      when "valid"   then AEC::TokenState::Valid
      when "expired" then AEC::TokenState::Expired
      else
        nil
      end
    end
  end
end
