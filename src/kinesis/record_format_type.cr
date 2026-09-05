private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum RecordFormatType
    GsrJson
    Json
    String
    ByteArray

    def self.to_json(e : RecordFormatType, json : JSON::Builder) : Nil
      value = case e
              when AK::RecordFormatType::GsrJson   then "GSR_JSON"
              when AK::RecordFormatType::Json      then "JSON"
              when AK::RecordFormatType::String    then "STRING"
              when AK::RecordFormatType::ByteArray then "BYTE_ARRAY"
              else
                raise Exception.new("unknown enum value for 'RecordFormatType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::RecordFormatType
      value = pull.read_string
      case value
      when "GSR_JSON"   then AK::RecordFormatType::GsrJson
      when "JSON"       then AK::RecordFormatType::Json
      when "STRING"     then AK::RecordFormatType::String
      when "BYTE_ARRAY" then AK::RecordFormatType::ByteArray
      else
        raise Exception.new("unknown enum value for 'RecordFormatType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::RecordFormatType::GsrJson   then "GSR_JSON"
      when AK::RecordFormatType::Json      then "JSON"
      when AK::RecordFormatType::String    then "STRING"
      when AK::RecordFormatType::ByteArray then "BYTE_ARRAY"
      else
        raise Exception.new("unknown enum value for 'RecordFormatType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::RecordFormatType?
      case key
      when "GSR_JSON"   then AK::RecordFormatType::GsrJson
      when "JSON"       then AK::RecordFormatType::Json
      when "STRING"     then AK::RecordFormatType::String
      when "BYTE_ARRAY" then AK::RecordFormatType::ByteArray
      else
        nil
      end
    end
  end
end
