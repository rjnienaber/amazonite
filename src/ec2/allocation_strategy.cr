private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AllocationStrategy
    LowestPrice
    Diversified
    CapacityOptimized
    CapacityOptimizedPrioritized
    PriceCapacityOptimized

    def self.to_json(e : AllocationStrategy, json : JSON::Builder) : Nil
      value = case e
              when AEC::AllocationStrategy::LowestPrice                  then "lowestPrice"
              when AEC::AllocationStrategy::Diversified                  then "diversified"
              when AEC::AllocationStrategy::CapacityOptimized            then "capacityOptimized"
              when AEC::AllocationStrategy::CapacityOptimizedPrioritized then "capacityOptimizedPrioritized"
              when AEC::AllocationStrategy::PriceCapacityOptimized       then "priceCapacityOptimized"
              else
                raise Exception.new("unknown enum value for 'AllocationStrategy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AllocationStrategy
      value = pull.read_string
      case value
      when "lowestPrice"                  then AEC::AllocationStrategy::LowestPrice
      when "diversified"                  then AEC::AllocationStrategy::Diversified
      when "capacityOptimized"            then AEC::AllocationStrategy::CapacityOptimized
      when "capacityOptimizedPrioritized" then AEC::AllocationStrategy::CapacityOptimizedPrioritized
      when "priceCapacityOptimized"       then AEC::AllocationStrategy::PriceCapacityOptimized
      else
        raise Exception.new("unknown enum value for 'AllocationStrategy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AllocationStrategy::LowestPrice                  then "lowestPrice"
      when AEC::AllocationStrategy::Diversified                  then "diversified"
      when AEC::AllocationStrategy::CapacityOptimized            then "capacityOptimized"
      when AEC::AllocationStrategy::CapacityOptimizedPrioritized then "capacityOptimizedPrioritized"
      when AEC::AllocationStrategy::PriceCapacityOptimized       then "priceCapacityOptimized"
      else
        raise Exception.new("unknown enum value for 'AllocationStrategy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AllocationStrategy?
      case key
      when "lowestPrice"                  then AEC::AllocationStrategy::LowestPrice
      when "diversified"                  then AEC::AllocationStrategy::Diversified
      when "capacityOptimized"            then AEC::AllocationStrategy::CapacityOptimized
      when "capacityOptimizedPrioritized" then AEC::AllocationStrategy::CapacityOptimizedPrioritized
      when "priceCapacityOptimized"       then AEC::AllocationStrategy::PriceCapacityOptimized
      else
        nil
      end
    end
  end
end
