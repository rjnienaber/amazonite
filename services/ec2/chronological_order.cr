private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The chronological order for returning results.
  enum ChronologicalOrder
    Forward
    Reverse

    def self.to_json(e : ChronologicalOrder, json : JSON::Builder) : Nil
      value = case e
              when AEC::ChronologicalOrder::Forward then "forward"
              when AEC::ChronologicalOrder::Reverse then "reverse"
              else
                raise Exception.new("unknown enum value for 'ChronologicalOrder' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ChronologicalOrder
      value = pull.read_string
      case value
      when "forward" then AEC::ChronologicalOrder::Forward
      when "reverse" then AEC::ChronologicalOrder::Reverse
      else
        raise Exception.new("unknown enum value for 'ChronologicalOrder' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ChronologicalOrder::Forward then "forward"
      when AEC::ChronologicalOrder::Reverse then "reverse"
      else
        raise Exception.new("unknown enum value for 'ChronologicalOrder' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ChronologicalOrder?
      case key
      when "forward" then AEC::ChronologicalOrder::Forward
      when "reverse" then AEC::ChronologicalOrder::Reverse
      else
        nil
      end
    end
  end
end
