private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FleetOnDemandAllocationStrategy
    LowestPrice
    Prioritized

    def self.to_json(e : FleetOnDemandAllocationStrategy, json : JSON::Builder) : Nil
      value = case e
              when AEC::FleetOnDemandAllocationStrategy::LowestPrice then "lowest-price"
              when AEC::FleetOnDemandAllocationStrategy::Prioritized then "prioritized"
              else
                raise Exception.new("unknown enum value for 'FleetOnDemandAllocationStrategy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FleetOnDemandAllocationStrategy
      value = pull.read_string
      case value
      when "lowest-price" then AEC::FleetOnDemandAllocationStrategy::LowestPrice
      when "prioritized"  then AEC::FleetOnDemandAllocationStrategy::Prioritized
      else
        raise Exception.new("unknown enum value for 'FleetOnDemandAllocationStrategy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FleetOnDemandAllocationStrategy::LowestPrice then "lowest-price"
      when AEC::FleetOnDemandAllocationStrategy::Prioritized then "prioritized"
      else
        raise Exception.new("unknown enum value for 'FleetOnDemandAllocationStrategy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FleetOnDemandAllocationStrategy?
      case key
      when "lowest-price" then AEC::FleetOnDemandAllocationStrategy::LowestPrice
      when "prioritized"  then AEC::FleetOnDemandAllocationStrategy::Prioritized
      else
        nil
      end
    end
  end
end
