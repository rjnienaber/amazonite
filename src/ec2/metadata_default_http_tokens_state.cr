private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum MetadataDefaultHttpTokensState
    Optional
    Required
    NoPreference

    def self.to_json(e : MetadataDefaultHttpTokensState, json : JSON::Builder) : Nil
      value = case e
              when AEC::MetadataDefaultHttpTokensState::Optional     then "optional"
              when AEC::MetadataDefaultHttpTokensState::Required     then "required"
              when AEC::MetadataDefaultHttpTokensState::NoPreference then "no-preference"
              else
                raise Exception.new("unknown enum value for 'MetadataDefaultHttpTokensState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::MetadataDefaultHttpTokensState
      value = pull.read_string
      case value
      when "optional"      then AEC::MetadataDefaultHttpTokensState::Optional
      when "required"      then AEC::MetadataDefaultHttpTokensState::Required
      when "no-preference" then AEC::MetadataDefaultHttpTokensState::NoPreference
      else
        raise Exception.new("unknown enum value for 'MetadataDefaultHttpTokensState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::MetadataDefaultHttpTokensState::Optional     then "optional"
      when AEC::MetadataDefaultHttpTokensState::Required     then "required"
      when AEC::MetadataDefaultHttpTokensState::NoPreference then "no-preference"
      else
        raise Exception.new("unknown enum value for 'MetadataDefaultHttpTokensState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::MetadataDefaultHttpTokensState?
      case key
      when "optional"      then AEC::MetadataDefaultHttpTokensState::Optional
      when "required"      then AEC::MetadataDefaultHttpTokensState::Required
      when "no-preference" then AEC::MetadataDefaultHttpTokensState::NoPreference
      else
        nil
      end
    end
  end
end
