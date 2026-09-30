private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum BareMetal
    Included
    Required
    Excluded

    def self.to_json(e : BareMetal, json : JSON::Builder) : Nil
      value = case e
              when AEC::BareMetal::Included then "included"
              when AEC::BareMetal::Required then "required"
              when AEC::BareMetal::Excluded then "excluded"
              else
                raise Exception.new("unknown enum value for 'BareMetal' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::BareMetal
      value = pull.read_string
      case value
      when "included" then AEC::BareMetal::Included
      when "required" then AEC::BareMetal::Required
      when "excluded" then AEC::BareMetal::Excluded
      else
        raise Exception.new("unknown enum value for 'BareMetal' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::BareMetal::Included then "included"
      when AEC::BareMetal::Required then "required"
      when AEC::BareMetal::Excluded then "excluded"
      else
        raise Exception.new("unknown enum value for 'BareMetal' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::BareMetal?
      case key
      when "included" then AEC::BareMetal::Included
      when "required" then AEC::BareMetal::Required
      when "excluded" then AEC::BareMetal::Excluded
      else
        nil
      end
    end
  end
end
