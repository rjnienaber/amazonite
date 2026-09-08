private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum Affinity
    Default
    Host

    def self.to_json(e : Affinity, json : JSON::Builder) : Nil
      value = case e
              when AEC::Affinity::Default then "default"
              when AEC::Affinity::Host    then "host"
              else
                raise Exception.new("unknown enum value for 'Affinity' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::Affinity
      value = pull.read_string
      case value
      when "default" then AEC::Affinity::Default
      when "host"    then AEC::Affinity::Host
      else
        raise Exception.new("unknown enum value for 'Affinity' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::Affinity::Default then "default"
      when AEC::Affinity::Host    then "host"
      else
        raise Exception.new("unknown enum value for 'Affinity' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::Affinity?
      case key
      when "default" then AEC::Affinity::Default
      when "host"    then AEC::Affinity::Host
      else
        nil
      end
    end
  end
end
