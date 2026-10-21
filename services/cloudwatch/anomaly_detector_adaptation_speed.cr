private alias ACW = Amazonite::CloudWatch

module Amazonite::CloudWatch
  enum AnomalyDetectorAdaptationSpeed
    Fast
    Normal
    Slow

    def self.to_json(e : AnomalyDetectorAdaptationSpeed, json : JSON::Builder) : Nil
      value = case e
              when ACW::AnomalyDetectorAdaptationSpeed::Fast   then "FAST"
              when ACW::AnomalyDetectorAdaptationSpeed::Normal then "NORMAL"
              when ACW::AnomalyDetectorAdaptationSpeed::Slow   then "SLOW"
              else
                raise Exception.new("unknown enum value for 'AnomalyDetectorAdaptationSpeed' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::AnomalyDetectorAdaptationSpeed
      value = pull.read_string
      case value
      when "FAST"   then ACW::AnomalyDetectorAdaptationSpeed::Fast
      when "NORMAL" then ACW::AnomalyDetectorAdaptationSpeed::Normal
      when "SLOW"   then ACW::AnomalyDetectorAdaptationSpeed::Slow
      else
        raise Exception.new("unknown enum value for 'AnomalyDetectorAdaptationSpeed' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACW::AnomalyDetectorAdaptationSpeed::Fast   then "FAST"
      when ACW::AnomalyDetectorAdaptationSpeed::Normal then "NORMAL"
      when ACW::AnomalyDetectorAdaptationSpeed::Slow   then "SLOW"
      else
        raise Exception.new("unknown enum value for 'AnomalyDetectorAdaptationSpeed' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACW::AnomalyDetectorAdaptationSpeed?
      case key
      when "FAST"   then ACW::AnomalyDetectorAdaptationSpeed::Fast
      when "NORMAL" then ACW::AnomalyDetectorAdaptationSpeed::Normal
      when "SLOW"   then ACW::AnomalyDetectorAdaptationSpeed::Slow
      else
        nil
      end
    end
  end
end
