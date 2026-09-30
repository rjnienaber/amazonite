private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpScopeEnum
    Private

    def self.to_json(e : IpScopeEnum, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpScopeEnum::Private then "private"
              else
                raise Exception.new("unknown enum value for 'IpScopeEnum' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpScopeEnum
      value = pull.read_string
      case value
      when "private" then AEC::IpScopeEnum::Private
      else
        raise Exception.new("unknown enum value for 'IpScopeEnum' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpScopeEnum::Private then "private"
      else
        raise Exception.new("unknown enum value for 'IpScopeEnum' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpScopeEnum?
      case key
      when "private" then AEC::IpScopeEnum::Private
      else
        nil
      end
    end
  end
end
