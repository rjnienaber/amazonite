private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # Returns the size of the CacheCluster.
  enum CacheClusterSize
    V05
    V16
    V61
    V135
    V284
    V582
    V118
    V237

    def self.to_json(e : CacheClusterSize, json : JSON::Builder) : Nil
      value = case e
              when AAG::CacheClusterSize::V05  then "0.5"
              when AAG::CacheClusterSize::V16  then "1.6"
              when AAG::CacheClusterSize::V61  then "6.1"
              when AAG::CacheClusterSize::V135 then "13.5"
              when AAG::CacheClusterSize::V284 then "28.4"
              when AAG::CacheClusterSize::V582 then "58.2"
              when AAG::CacheClusterSize::V118 then "118"
              when AAG::CacheClusterSize::V237 then "237"
              else
                raise Exception.new("unknown enum value for 'CacheClusterSize' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::CacheClusterSize
      value = pull.read_string
      case value
      when "0.5"  then AAG::CacheClusterSize::V05
      when "1.6"  then AAG::CacheClusterSize::V16
      when "6.1"  then AAG::CacheClusterSize::V61
      when "13.5" then AAG::CacheClusterSize::V135
      when "28.4" then AAG::CacheClusterSize::V284
      when "58.2" then AAG::CacheClusterSize::V582
      when "118"  then AAG::CacheClusterSize::V118
      when "237"  then AAG::CacheClusterSize::V237
      else
        raise Exception.new("unknown enum value for 'CacheClusterSize' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::CacheClusterSize::V05  then "0.5"
      when AAG::CacheClusterSize::V16  then "1.6"
      when AAG::CacheClusterSize::V61  then "6.1"
      when AAG::CacheClusterSize::V135 then "13.5"
      when AAG::CacheClusterSize::V284 then "28.4"
      when AAG::CacheClusterSize::V582 then "58.2"
      when AAG::CacheClusterSize::V118 then "118"
      when AAG::CacheClusterSize::V237 then "237"
      else
        raise Exception.new("unknown enum value for 'CacheClusterSize' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::CacheClusterSize?
      case key
      when "0.5"  then AAG::CacheClusterSize::V05
      when "1.6"  then AAG::CacheClusterSize::V16
      when "6.1"  then AAG::CacheClusterSize::V61
      when "13.5" then AAG::CacheClusterSize::V135
      when "28.4" then AAG::CacheClusterSize::V284
      when "58.2" then AAG::CacheClusterSize::V582
      when "118"  then AAG::CacheClusterSize::V118
      when "237"  then AAG::CacheClusterSize::V237
      else
        nil
      end
    end
  end
end
