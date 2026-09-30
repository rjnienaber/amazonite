private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamScopeType
    Public
    Private

    def self.to_json(e : IpamScopeType, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamScopeType::Public  then "public"
              when AEC::IpamScopeType::Private then "private"
              else
                raise Exception.new("unknown enum value for 'IpamScopeType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamScopeType
      value = pull.read_string
      case value
      when "public"  then AEC::IpamScopeType::Public
      when "private" then AEC::IpamScopeType::Private
      else
        raise Exception.new("unknown enum value for 'IpamScopeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamScopeType::Public  then "public"
      when AEC::IpamScopeType::Private then "private"
      else
        raise Exception.new("unknown enum value for 'IpamScopeType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamScopeType?
      case key
      when "public"  then AEC::IpamScopeType::Public
      when "private" then AEC::IpamScopeType::Private
      else
        nil
      end
    end
  end
end
