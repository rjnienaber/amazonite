private alias AS = Amazonite::S3

module Amazonite::S3
  enum ExpirationState
    Enabled
    Disabled

    def self.to_json(e : ExpirationState, json : JSON::Builder) : Nil
      value = case e
              when AS::ExpirationState::Enabled  then "ENABLED"
              when AS::ExpirationState::Disabled then "DISABLED"
              else
                raise Exception.new("unknown enum value for 'ExpirationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ExpirationState
      value = pull.read_string
      case value
      when "ENABLED"  then AS::ExpirationState::Enabled
      when "DISABLED" then AS::ExpirationState::Disabled
      else
        raise Exception.new("unknown enum value for 'ExpirationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ExpirationState::Enabled  then "ENABLED"
      when AS::ExpirationState::Disabled then "DISABLED"
      else
        raise Exception.new("unknown enum value for 'ExpirationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ExpirationState?
      case key
      when "ENABLED"  then AS::ExpirationState::Enabled
      when "DISABLED" then AS::ExpirationState::Disabled
      else
        nil
      end
    end
  end
end
