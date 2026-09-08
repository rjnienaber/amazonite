private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ContainerFormat
    Ova

    def self.to_json(e : ContainerFormat, json : JSON::Builder) : Nil
      value = case e
              when AEC::ContainerFormat::Ova then "ova"
              else
                raise Exception.new("unknown enum value for 'ContainerFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ContainerFormat
      value = pull.read_string
      case value
      when "ova" then AEC::ContainerFormat::Ova
      else
        raise Exception.new("unknown enum value for 'ContainerFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ContainerFormat::Ova then "ova"
      else
        raise Exception.new("unknown enum value for 'ContainerFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ContainerFormat?
      case key
      when "ova" then AEC::ContainerFormat::Ova
      else
        nil
      end
    end
  end
end
