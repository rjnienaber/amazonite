private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceGeneration
    Current
    Previous

    def self.to_json(e : InstanceGeneration, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceGeneration::Current  then "current"
              when AEC::InstanceGeneration::Previous then "previous"
              else
                raise Exception.new("unknown enum value for 'InstanceGeneration' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceGeneration
      value = pull.read_string
      case value
      when "current"  then AEC::InstanceGeneration::Current
      when "previous" then AEC::InstanceGeneration::Previous
      else
        raise Exception.new("unknown enum value for 'InstanceGeneration' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceGeneration::Current  then "current"
      when AEC::InstanceGeneration::Previous then "previous"
      else
        raise Exception.new("unknown enum value for 'InstanceGeneration' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceGeneration?
      case key
      when "current"  then AEC::InstanceGeneration::Current
      when "previous" then AEC::InstanceGeneration::Previous
      else
        nil
      end
    end
  end
end
