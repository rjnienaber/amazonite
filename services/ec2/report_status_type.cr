private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ReportStatusType
    Ok
    Impaired

    def self.to_json(e : ReportStatusType, json : JSON::Builder) : Nil
      value = case e
              when AEC::ReportStatusType::Ok       then "ok"
              when AEC::ReportStatusType::Impaired then "impaired"
              else
                raise Exception.new("unknown enum value for 'ReportStatusType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ReportStatusType
      value = pull.read_string
      case value
      when "ok"       then AEC::ReportStatusType::Ok
      when "impaired" then AEC::ReportStatusType::Impaired
      else
        raise Exception.new("unknown enum value for 'ReportStatusType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ReportStatusType::Ok       then "ok"
      when AEC::ReportStatusType::Impaired then "impaired"
      else
        raise Exception.new("unknown enum value for 'ReportStatusType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ReportStatusType?
      case key
      when "ok"       then AEC::ReportStatusType::Ok
      when "impaired" then AEC::ReportStatusType::Impaired
      else
        nil
      end
    end
  end
end
