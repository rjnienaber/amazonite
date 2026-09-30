private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum OnDemandAllocationStrategy
    LowestPrice
    Prioritized

    def self.to_json(e : OnDemandAllocationStrategy, json : JSON::Builder) : Nil
      value = case e
              when AEC::OnDemandAllocationStrategy::LowestPrice then "lowestPrice"
              when AEC::OnDemandAllocationStrategy::Prioritized then "prioritized"
              else
                raise Exception.new("unknown enum value for 'OnDemandAllocationStrategy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::OnDemandAllocationStrategy
      value = pull.read_string
      case value
      when "lowestPrice" then AEC::OnDemandAllocationStrategy::LowestPrice
      when "prioritized" then AEC::OnDemandAllocationStrategy::Prioritized
      else
        raise Exception.new("unknown enum value for 'OnDemandAllocationStrategy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::OnDemandAllocationStrategy::LowestPrice then "lowestPrice"
      when AEC::OnDemandAllocationStrategy::Prioritized then "prioritized"
      else
        raise Exception.new("unknown enum value for 'OnDemandAllocationStrategy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::OnDemandAllocationStrategy?
      case key
      when "lowestPrice" then AEC::OnDemandAllocationStrategy::LowestPrice
      when "prioritized" then AEC::OnDemandAllocationStrategy::Prioritized
      else
        nil
      end
    end
  end
end
