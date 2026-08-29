private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum ReportFormatType
    TextCsv

    def self.to_json(e : ReportFormatType, json : JSON::Builder) : Nil
      value = case e
              when AI::ReportFormatType::TextCsv then "text/csv"
              else
                raise Exception.new("unknown enum value for 'ReportFormatType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::ReportFormatType
      value = pull.read_string
      case value
      when "text/csv" then AI::ReportFormatType::TextCsv
      else
        raise Exception.new("unknown enum value for 'ReportFormatType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::ReportFormatType::TextCsv then "text/csv"
      else
        raise Exception.new("unknown enum value for 'ReportFormatType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::ReportFormatType?
      case key
      when "text/csv" then AI::ReportFormatType::TextCsv
      else
        nil
      end
    end
  end
end
