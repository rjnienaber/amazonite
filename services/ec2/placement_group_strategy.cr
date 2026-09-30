private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PlacementGroupStrategy
    Cluster
    Partition
    Spread

    def self.to_json(e : PlacementGroupStrategy, json : JSON::Builder) : Nil
      value = case e
              when AEC::PlacementGroupStrategy::Cluster   then "cluster"
              when AEC::PlacementGroupStrategy::Partition then "partition"
              when AEC::PlacementGroupStrategy::Spread    then "spread"
              else
                raise Exception.new("unknown enum value for 'PlacementGroupStrategy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PlacementGroupStrategy
      value = pull.read_string
      case value
      when "cluster"   then AEC::PlacementGroupStrategy::Cluster
      when "partition" then AEC::PlacementGroupStrategy::Partition
      when "spread"    then AEC::PlacementGroupStrategy::Spread
      else
        raise Exception.new("unknown enum value for 'PlacementGroupStrategy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::PlacementGroupStrategy::Cluster   then "cluster"
      when AEC::PlacementGroupStrategy::Partition then "partition"
      when AEC::PlacementGroupStrategy::Spread    then "spread"
      else
        raise Exception.new("unknown enum value for 'PlacementGroupStrategy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::PlacementGroupStrategy?
      case key
      when "cluster"   then AEC::PlacementGroupStrategy::Cluster
      when "partition" then AEC::PlacementGroupStrategy::Partition
      when "spread"    then AEC::PlacementGroupStrategy::Spread
      else
        nil
      end
    end
  end
end
