private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum IndexType
    Facet
    FieldIndex

    def self.to_json(e : IndexType, json : JSON::Builder) : Nil
      value = case e
              when ACWL::IndexType::Facet      then "FACET"
              when ACWL::IndexType::FieldIndex then "FIELD_INDEX"
              else
                raise Exception.new("unknown enum value for 'IndexType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::IndexType
      value = pull.read_string
      case value
      when "FACET"       then ACWL::IndexType::Facet
      when "FIELD_INDEX" then ACWL::IndexType::FieldIndex
      else
        raise Exception.new("unknown enum value for 'IndexType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::IndexType::Facet      then "FACET"
      when ACWL::IndexType::FieldIndex then "FIELD_INDEX"
      else
        raise Exception.new("unknown enum value for 'IndexType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::IndexType?
      case key
      when "FACET"       then ACWL::IndexType::Facet
      when "FIELD_INDEX" then ACWL::IndexType::FieldIndex
      else
        nil
      end
    end
  end
end
