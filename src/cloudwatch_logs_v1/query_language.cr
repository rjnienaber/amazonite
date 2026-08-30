private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum QueryLanguage
    Cwli
    Sql
    Ppl

    def self.to_json(e : QueryLanguage, json : JSON::Builder) : Nil
      value = case e
              when ACWL::QueryLanguage::Cwli then "CWLI"
              when ACWL::QueryLanguage::Sql  then "SQL"
              when ACWL::QueryLanguage::Ppl  then "PPL"
              else
                raise Exception.new("unknown enum value for 'QueryLanguage' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::QueryLanguage
      value = pull.read_string
      case value
      when "CWLI" then ACWL::QueryLanguage::Cwli
      when "SQL"  then ACWL::QueryLanguage::Sql
      when "PPL"  then ACWL::QueryLanguage::Ppl
      else
        raise Exception.new("unknown enum value for 'QueryLanguage' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::QueryLanguage::Cwli then "CWLI"
      when ACWL::QueryLanguage::Sql  then "SQL"
      when ACWL::QueryLanguage::Ppl  then "PPL"
      else
        raise Exception.new("unknown enum value for 'QueryLanguage' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::QueryLanguage?
      case key
      when "CWLI" then ACWL::QueryLanguage::Cwli
      when "SQL"  then ACWL::QueryLanguage::Sql
      when "PPL"  then ACWL::QueryLanguage::Ppl
      else
        nil
      end
    end
  end
end
