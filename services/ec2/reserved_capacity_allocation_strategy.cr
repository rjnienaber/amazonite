private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ReservedCapacityAllocationStrategy
    Prioritized

    def self.to_json(e : ReservedCapacityAllocationStrategy, json : JSON::Builder) : Nil
      value = case e
              when AEC::ReservedCapacityAllocationStrategy::Prioritized then "prioritized"
              else
                raise Exception.new("unknown enum value for 'ReservedCapacityAllocationStrategy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ReservedCapacityAllocationStrategy
      value = pull.read_string
      case value
      when "prioritized" then AEC::ReservedCapacityAllocationStrategy::Prioritized
      else
        raise Exception.new("unknown enum value for 'ReservedCapacityAllocationStrategy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ReservedCapacityAllocationStrategy::Prioritized then "prioritized"
      else
        raise Exception.new("unknown enum value for 'ReservedCapacityAllocationStrategy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ReservedCapacityAllocationStrategy?
      case key
      when "prioritized" then AEC::ReservedCapacityAllocationStrategy::Prioritized
      else
        nil
      end
    end
  end
end
