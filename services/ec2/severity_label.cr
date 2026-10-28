private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SeverityLabel
    Informational
    Low
    Medium
    High
    Critical

    def self.to_json(e : SeverityLabel, json : JSON::Builder) : Nil
      value = case e
              when AEC::SeverityLabel::Informational then "informational"
              when AEC::SeverityLabel::Low           then "low"
              when AEC::SeverityLabel::Medium        then "medium"
              when AEC::SeverityLabel::High          then "high"
              when AEC::SeverityLabel::Critical      then "critical"
              else
                raise Exception.new("unknown enum value for 'SeverityLabel' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SeverityLabel
      value = pull.read_string
      case value
      when "informational" then AEC::SeverityLabel::Informational
      when "low"           then AEC::SeverityLabel::Low
      when "medium"        then AEC::SeverityLabel::Medium
      when "high"          then AEC::SeverityLabel::High
      when "critical"      then AEC::SeverityLabel::Critical
      else
        raise Exception.new("unknown enum value for 'SeverityLabel' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SeverityLabel::Informational then "informational"
      when AEC::SeverityLabel::Low           then "low"
      when AEC::SeverityLabel::Medium        then "medium"
      when AEC::SeverityLabel::High          then "high"
      when AEC::SeverityLabel::Critical      then "critical"
      else
        raise Exception.new("unknown enum value for 'SeverityLabel' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SeverityLabel?
      case key
      when "informational" then AEC::SeverityLabel::Informational
      when "low"           then AEC::SeverityLabel::Low
      when "medium"        then AEC::SeverityLabel::Medium
      when "high"          then AEC::SeverityLabel::High
      when "critical"      then AEC::SeverityLabel::Critical
      else
        nil
      end
    end
  end
end
