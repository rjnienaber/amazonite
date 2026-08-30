private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  enum ApiDestinationState
    Active
    Inactive

    def self.to_json(e : ApiDestinationState, json : JSON::Builder) : Nil
      value = case e
              when AEB::ApiDestinationState::Active   then "ACTIVE"
              when AEB::ApiDestinationState::Inactive then "INACTIVE"
              else
                raise Exception.new("unknown enum value for 'ApiDestinationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::ApiDestinationState
      value = pull.read_string
      case value
      when "ACTIVE"   then AEB::ApiDestinationState::Active
      when "INACTIVE" then AEB::ApiDestinationState::Inactive
      else
        raise Exception.new("unknown enum value for 'ApiDestinationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::ApiDestinationState::Active   then "ACTIVE"
      when AEB::ApiDestinationState::Inactive then "INACTIVE"
      else
        raise Exception.new("unknown enum value for 'ApiDestinationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::ApiDestinationState?
      case key
      when "ACTIVE"   then AEB::ApiDestinationState::Active
      when "INACTIVE" then AEB::ApiDestinationState::Inactive
      else
        nil
      end
    end
  end
end
