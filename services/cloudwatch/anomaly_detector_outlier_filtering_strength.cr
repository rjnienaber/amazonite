private alias ACW = Amazonite::CloudWatch

module Amazonite::CloudWatch
  enum AnomalyDetectorOutlierFilteringStrength
    Minimal
    Moderate
    Strict

    def self.to_json(e : AnomalyDetectorOutlierFilteringStrength, json : JSON::Builder) : Nil
      value = case e
              when ACW::AnomalyDetectorOutlierFilteringStrength::Minimal  then "MINIMAL"
              when ACW::AnomalyDetectorOutlierFilteringStrength::Moderate then "MODERATE"
              when ACW::AnomalyDetectorOutlierFilteringStrength::Strict   then "STRICT"
              else
                raise Exception.new("unknown enum value for 'AnomalyDetectorOutlierFilteringStrength' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::AnomalyDetectorOutlierFilteringStrength
      value = pull.read_string
      case value
      when "MINIMAL"  then ACW::AnomalyDetectorOutlierFilteringStrength::Minimal
      when "MODERATE" then ACW::AnomalyDetectorOutlierFilteringStrength::Moderate
      when "STRICT"   then ACW::AnomalyDetectorOutlierFilteringStrength::Strict
      else
        raise Exception.new("unknown enum value for 'AnomalyDetectorOutlierFilteringStrength' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACW::AnomalyDetectorOutlierFilteringStrength::Minimal  then "MINIMAL"
      when ACW::AnomalyDetectorOutlierFilteringStrength::Moderate then "MODERATE"
      when ACW::AnomalyDetectorOutlierFilteringStrength::Strict   then "STRICT"
      else
        raise Exception.new("unknown enum value for 'AnomalyDetectorOutlierFilteringStrength' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACW::AnomalyDetectorOutlierFilteringStrength?
      case key
      when "MINIMAL"  then ACW::AnomalyDetectorOutlierFilteringStrength::Minimal
      when "MODERATE" then ACW::AnomalyDetectorOutlierFilteringStrength::Moderate
      when "STRICT"   then ACW::AnomalyDetectorOutlierFilteringStrength::Strict
      else
        nil
      end
    end
  end
end
