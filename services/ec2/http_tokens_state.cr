private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum HttpTokensState
    Optional
    Required

    def self.to_json(e : HttpTokensState, json : JSON::Builder) : Nil
      value = case e
              when AEC::HttpTokensState::Optional then "optional"
              when AEC::HttpTokensState::Required then "required"
              else
                raise Exception.new("unknown enum value for 'HttpTokensState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::HttpTokensState
      value = pull.read_string
      case value
      when "optional" then AEC::HttpTokensState::Optional
      when "required" then AEC::HttpTokensState::Required
      else
        raise Exception.new("unknown enum value for 'HttpTokensState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::HttpTokensState::Optional then "optional"
      when AEC::HttpTokensState::Required then "required"
      else
        raise Exception.new("unknown enum value for 'HttpTokensState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::HttpTokensState?
      case key
      when "optional" then AEC::HttpTokensState::Optional
      when "required" then AEC::HttpTokensState::Required
      else
        nil
      end
    end
  end
end
