private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PlacementStrategy
    Cluster
    Spread
    Partition
    PrecisionTime

    def self.to_json(e : PlacementStrategy, json : JSON::Builder) : Nil
      value = case e
              when AEC::PlacementStrategy::Cluster       then "cluster"
              when AEC::PlacementStrategy::Spread        then "spread"
              when AEC::PlacementStrategy::Partition     then "partition"
              when AEC::PlacementStrategy::PrecisionTime then "precision-time"
              else
                raise Exception.new("unknown enum value for 'PlacementStrategy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PlacementStrategy
      value = pull.read_string
      case value
      when "cluster"        then AEC::PlacementStrategy::Cluster
      when "spread"         then AEC::PlacementStrategy::Spread
      when "partition"      then AEC::PlacementStrategy::Partition
      when "precision-time" then AEC::PlacementStrategy::PrecisionTime
      else
        raise Exception.new("unknown enum value for 'PlacementStrategy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::PlacementStrategy::Cluster       then "cluster"
      when AEC::PlacementStrategy::Spread        then "spread"
      when AEC::PlacementStrategy::Partition     then "partition"
      when AEC::PlacementStrategy::PrecisionTime then "precision-time"
      else
        raise Exception.new("unknown enum value for 'PlacementStrategy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::PlacementStrategy?
      case key
      when "cluster"        then AEC::PlacementStrategy::Cluster
      when "spread"         then AEC::PlacementStrategy::Spread
      when "partition"      then AEC::PlacementStrategy::Partition
      when "precision-time" then AEC::PlacementStrategy::PrecisionTime
      else
        nil
      end
    end
  end
end
