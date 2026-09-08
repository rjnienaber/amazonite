private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum Comparison
    Equals
    In

    def self.to_json(e : Comparison, json : JSON::Builder) : Nil
      value = case e
              when AEC::Comparison::Equals then "equals"
              when AEC::Comparison::In     then "in"
              else
                raise Exception.new("unknown enum value for 'Comparison' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::Comparison
      value = pull.read_string
      case value
      when "equals" then AEC::Comparison::Equals
      when "in"     then AEC::Comparison::In
      else
        raise Exception.new("unknown enum value for 'Comparison' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::Comparison::Equals then "equals"
      when AEC::Comparison::In     then "in"
      else
        raise Exception.new("unknown enum value for 'Comparison' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::Comparison?
      case key
      when "equals" then AEC::Comparison::Equals
      when "in"     then AEC::Comparison::In
      else
        nil
      end
    end
  end
end
