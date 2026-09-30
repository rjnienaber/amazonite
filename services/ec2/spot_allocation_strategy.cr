private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SpotAllocationStrategy
    LowestPrice
    Diversified
    CapacityOptimized
    CapacityOptimizedPrioritized
    PriceCapacityOptimized

    def self.to_json(e : SpotAllocationStrategy, json : JSON::Builder) : Nil
      value = case e
              when AEC::SpotAllocationStrategy::LowestPrice                  then "lowest-price"
              when AEC::SpotAllocationStrategy::Diversified                  then "diversified"
              when AEC::SpotAllocationStrategy::CapacityOptimized            then "capacity-optimized"
              when AEC::SpotAllocationStrategy::CapacityOptimizedPrioritized then "capacity-optimized-prioritized"
              when AEC::SpotAllocationStrategy::PriceCapacityOptimized       then "price-capacity-optimized"
              else
                raise Exception.new("unknown enum value for 'SpotAllocationStrategy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SpotAllocationStrategy
      value = pull.read_string
      case value
      when "lowest-price"                   then AEC::SpotAllocationStrategy::LowestPrice
      when "diversified"                    then AEC::SpotAllocationStrategy::Diversified
      when "capacity-optimized"             then AEC::SpotAllocationStrategy::CapacityOptimized
      when "capacity-optimized-prioritized" then AEC::SpotAllocationStrategy::CapacityOptimizedPrioritized
      when "price-capacity-optimized"       then AEC::SpotAllocationStrategy::PriceCapacityOptimized
      else
        raise Exception.new("unknown enum value for 'SpotAllocationStrategy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SpotAllocationStrategy::LowestPrice                  then "lowest-price"
      when AEC::SpotAllocationStrategy::Diversified                  then "diversified"
      when AEC::SpotAllocationStrategy::CapacityOptimized            then "capacity-optimized"
      when AEC::SpotAllocationStrategy::CapacityOptimizedPrioritized then "capacity-optimized-prioritized"
      when AEC::SpotAllocationStrategy::PriceCapacityOptimized       then "price-capacity-optimized"
      else
        raise Exception.new("unknown enum value for 'SpotAllocationStrategy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SpotAllocationStrategy?
      case key
      when "lowest-price"                   then AEC::SpotAllocationStrategy::LowestPrice
      when "diversified"                    then AEC::SpotAllocationStrategy::Diversified
      when "capacity-optimized"             then AEC::SpotAllocationStrategy::CapacityOptimized
      when "capacity-optimized-prioritized" then AEC::SpotAllocationStrategy::CapacityOptimizedPrioritized
      when "price-capacity-optimized"       then AEC::SpotAllocationStrategy::PriceCapacityOptimized
      else
        nil
      end
    end
  end
end
