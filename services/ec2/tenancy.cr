private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum Tenancy
    Default
    Dedicated
    Host

    def self.to_json(e : Tenancy, json : JSON::Builder) : Nil
      value = case e
              when AEC::Tenancy::Default   then "default"
              when AEC::Tenancy::Dedicated then "dedicated"
              when AEC::Tenancy::Host      then "host"
              else
                raise Exception.new("unknown enum value for 'Tenancy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::Tenancy
      value = pull.read_string
      case value
      when "default"   then AEC::Tenancy::Default
      when "dedicated" then AEC::Tenancy::Dedicated
      when "host"      then AEC::Tenancy::Host
      else
        raise Exception.new("unknown enum value for 'Tenancy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::Tenancy::Default   then "default"
      when AEC::Tenancy::Dedicated then "dedicated"
      when AEC::Tenancy::Host      then "host"
      else
        raise Exception.new("unknown enum value for 'Tenancy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::Tenancy?
      case key
      when "default"   then AEC::Tenancy::Default
      when "dedicated" then AEC::Tenancy::Dedicated
      when "host"      then AEC::Tenancy::Host
      else
        nil
      end
    end
  end
end
